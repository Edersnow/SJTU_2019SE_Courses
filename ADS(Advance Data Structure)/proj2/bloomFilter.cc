#include "bloomFilter.h"
#include "MurmurHash3.h"
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <fstream>

bloomFilter::bloomFilter(): filter(nullptr){

}

bloomFilter::~bloomFilter() {
    if (filter) {
        free(filter);
        filter = nullptr;
    }
}

bloomFilter::bloomFilter(bloomFilter &&other) noexcept {
    filter = other.filter;
    other.filter = nullptr;
}


void bloomFilter::initialize() {
    if (filter) {
        free(filter);
        filter = nullptr;
    }
    filter = malloc(FILTER_SIZE);
    if (!filter) {
        std::cerr << "Error: Fail to malloc." << std::endl;
        exit(1);
    }
    memset(filter, 0, FILTER_SIZE);
}

void bloomFilter::addNewKey(uint64_t key) {
    if (!filter)  return;

    void *hashRes = malloc(16);
    if (!hashRes) {
        std::cerr << "Error: Fail to malloc." << std::endl;
        exit(1);
    }

    MurmurHash3_x64_128(&key, 8, 1, hashRes);

    for (int i = 0; i < 4; ++i) {
        // position (bits)
        uint32_t resPosition = (((uint32_t *)hashRes)[i]) % (FILTER_SIZE << 3);

        // position (bytes)
        uint32_t countBytes = resPosition >> 3;

        // which bits
        uint8_t countBits = resPosition & 0b111;

        (((uint8_t *)filter)[countBytes]) |= (1 << countBits);
    }

    free(hashRes);
}

bool bloomFilter::judgeKey(uint64_t key) const {
    // if the filter didn't initialize, just return true
    if (!filter)  return true;

    void *hashRes = malloc(16);
    if (!hashRes) {
        std::cerr << "Error: Fail to malloc." << std::endl;
        exit(1);
    }

    MurmurHash3_x64_128(&key, 8, 1, hashRes);

    for (int i = 0; i < 4; ++i) {
        // position (bits)
        uint32_t resPosition = ((uint32_t *)hashRes)[i] % (FILTER_SIZE << 3);

        // position (bytes)
        uint32_t countBytes = resPosition >> 3;

        // which bits
        uint8_t countBits = resPosition & 0b111;

        if( !(((uint8_t *)filter)[countBytes] & (1 << countBits)) ){
            free(hashRes);
            return false;
        }
    }

    free(hashRes);
    return true;
}

void bloomFilter::readFilter(const std::string &filePath, uint32_t startPoint) {
    std::ifstream in;

    in.open(filePath, std::ios_base::in | std::ios_base::binary);
    if (!in.is_open()) {
        std::cerr << "ERROR: Fail to open file." << std::endl;
        exit(1);
    }

    if (!filter) {
        filter = malloc(FILTER_SIZE);
        if (!filter) {
            std::cerr << "Error: Fail to malloc." << std::endl;
            exit(1);
        }
    }

    in.seekg(startPoint, std::ios_base::beg);
    in.read((char *) filter, FILTER_SIZE);

    if (!in.good()) {
        std::cerr << "ERROR: Fail to read filter." << std::endl;
        exit(1);
    }

    in.close();
}

void bloomFilter::writeFilter(const std::string &filePath) const {
    if (!filter)  return;

    std::ofstream out;
    out.open(filePath, std::ios_base::out | std::ios_base::binary | std::ios_base::app);
    if (!out.is_open()) {
        std::cerr << "ERROR: Fail to open file." << std::endl;
        exit(1);
    }

    out.write((char *) filter, FILTER_SIZE);
    if (!out.good()) {
        std::cerr << "ERROR: Fail to write filter." << std::endl;
        exit(1);
    }

    out.close();
}

void bloomFilter::setFilterNull() {
    if (filter) {
        free(filter);
        filter = nullptr;
    }
}


