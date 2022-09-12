#include <fstream>
#include <iostream>
#include "ssTableHeader.h"

void ssTableHeader::readHeader(const std::string& filePath, uint32_t startPoint) {
    std::ifstream in;

    in.open(filePath, std::ios_base::in | std::ios_base::binary);
    if (!in.is_open()) {
        std::cerr << "ERROR: Fail to open file." << std::endl;
        exit(1);
    }

    in.seekg(startPoint, std::ios_base::beg);
    in.read((char *) &timeStamp, sizeof (uint64_t));
    in.read((char *) &keyNumber, sizeof (uint64_t));
    in.read((char *) &maxKey, sizeof (uint64_t));
    in.read((char *) &minKey, sizeof (uint64_t));

    if (!in.good()) {
        std::cerr << "ERROR: Fail to read filter." << std::endl;
        exit(1);
    }

    in.close();
}

void ssTableHeader::writeHeader(const std::string& filePath) const{
    std::ofstream out;
    out.open(filePath, std::ios_base::out | std::ios_base::binary | std::ios_base::app);
    if (!out.is_open()) {
        std::cerr << "ERROR: Fail to open file." << std::endl;
        exit(1);
    }

    out.write((char *) &timeStamp, sizeof (uint64_t));
    out.write((char *) &keyNumber, sizeof (uint64_t));
    out.write((char *) &maxKey, sizeof (uint64_t));
    out.write((char *) &minKey, sizeof (uint64_t));

    if (!out.good()) {
        std::cerr << "ERROR: Fail to write filter." << std::endl;
        exit(1);
    }

    out.close();
}
