#include <fstream>
#include <iostream>
#include "ssTableCacheCell.h"
#include "utils.h"

int64_t ssTableCacheCell::find(uint64_t key, uint32_t l, uint32_t r) const {
    if (!indexArray)  return -1;
    if (l > r)  return -1;
    uint32_t m = (l + r) >> 1;
    if (indexArray[m].first == key)  return m;
    if (indexArray[m].first < key)  return find(key, m + 1, r);
    return find(key, l, m - 1);
}

ssTableCacheCell::ssTableCacheCell(ssTableCacheCell &&other) noexcept: filter(std::move(other.filter)){
    indexArray = other.indexArray;
    other.indexArray = nullptr;
}


ssTableCacheCell::~ssTableCacheCell() {
    delete [] indexArray;
    indexArray = nullptr;
}

void ssTableCacheCell::readCacheCell(const std::string &f) {
    filePath = f;

    header.readHeader(filePath, 0);
#ifdef storeBloomFilter
    filter.readFilter(filePath, ssTableHeader::HEADER_SIZE);
#endif
#ifdef storeKeyOffset
    indexArray = new std::pair<uint64_t, uint32_t> [header.keyNumber];

    std::ifstream in;
    in.open(filePath, std::ios_base::in | std::ios_base::binary);
    if (!in.is_open()) {
        std::cerr << "ERROR: Fail to open file." << std::endl;
        exit(1);
    }

    in.seekg(ssTableHeader::HEADER_SIZE + bloomFilter::FILTER_SIZE, std::ios_base::beg);

    for (uint64_t i = 0; i < header.keyNumber; ++i) {
        in.read((char *) &(indexArray[i].first), sizeof (uint64_t));
        in.read((char *) &(indexArray[i].second), sizeof (uint32_t));
    }

    if (!in.good()) {
        std::cerr << "ERROR: Fail to read KVArray." << std::endl;
        exit(1);
    }

    in.close();
#endif
}

std::pair<bool, std::string> ssTableCacheCell::getValue(uint64_t key) const {
#ifndef storeKeyOffset
    return getValueWithoutKVArray(key);
#else
    std::pair<bool, std::string> res(false, "");
    // filter will return true without initialization
    if (indexArray == nullptr || key < header.minKey || key > header.maxKey || !filter.judgeKey(key)) {
        return res;
    }

    int64_t test = find(key, 0, header.keyNumber - 1);
    if (test == -1) {
        return res;
    }

    std::ifstream in;

    in.open(filePath, std::ios_base::in | std::ios_base::binary);
    if (!in.is_open()) {
        std::cerr << "ERROR: Fail to open file." << std::endl;
        exit(1);
    }

    uint32_t startOff = (indexArray[test]).second;
    uint32_t endOff;

    if (uint64_t (test) == header.keyNumber - 1) {
        in.seekg(0, std::ios_base::end);
        endOff = in.tellg();
    } else {
        endOff = (indexArray[test + 1]).second;
    }

    res.first = true;
    char *tmp = new char [endOff - startOff];

    in.seekg(startOff, std::ios_base::beg);
    in.read(tmp, static_cast<int32_t>((endOff - startOff) * sizeof (char)));
    res.second = std::string(tmp, endOff - startOff);

    if (!in.good()) {
        std::cerr << "ERROR: Fail to read values." << std::endl;
        exit(1);
    }

    delete [] tmp;
    in.close();

    return res;
#endif
}

void ssTableCacheCell::deleteSsTable() {
    if (utils::rmfile(filePath.c_str())){
        std::cerr << "ERROR: Fail to delete files." << std::endl;
        exit(1);
    }

    delete [] indexArray;
    indexArray = nullptr;
}

ssTableCacheCell *ssTableCacheCell::Generator(const std::string &filePath, uint64_t timeStamp,
                                              const std::vector<std::pair<uint64_t, std::string>> &kVarray) {
    auto newCell = new ssTableCacheCell;
    newCell->filter.initialize();

    uint64_t &maxKey = newCell->header.maxKey;
    uint64_t &minKey = newCell->header.minKey;
    uint64_t &keyNumber = newCell->header.keyNumber;

    auto it = kVarray.cbegin();
    maxKey = minKey = it->first;
    keyNumber = 0;
    while (it != kVarray.cend()) {
        ++keyNumber;
        if (it->first > maxKey)  maxKey = it->first;
        if (it->first < minKey)  minKey = it->first;

        newCell->filter.addNewKey(it->first);

        ++it;
    }

    // write header
    newCell->header.timeStamp = timeStamp;
    newCell->header.writeHeader(filePath);

    // write filter
    newCell->filter.writeFilter(filePath);
#ifndef storeBloomFilter
    newCell->filter.setFilterNull();
#endif

    // write key & offset
    std::ofstream out;
    out.open(filePath, std::ios_base::out | std::ios_base::binary | std::ios_base::app);
    if (!out.is_open()) {
        std::cerr << "ERROR: Fail to open file." << std::endl;
        exit(1);
    }

    uint32_t offset = ssTableHeader::HEADER_SIZE + bloomFilter::FILTER_SIZE + keyNumber * (sizeof (uint32_t) + sizeof (uint64_t));

#ifdef storeKeyOffset
    newCell->indexArray = new std::pair<uint64_t, uint32_t> [keyNumber];
    uint64_t i = 0;
#endif
    it = kVarray.cbegin();
    while (it != kVarray.cend()) {
        out.write((char *) &(it->first), sizeof (uint64_t));
        out.write((char *) &offset, sizeof (uint32_t));

#ifdef storeKeyOffset
        newCell->indexArray[i++] = std::pair<uint64_t, uint32_t> (it->first, offset);
#endif

        offset += it->second.length() * sizeof (char);

        ++it;
    }

    newCell->filePath = filePath;

    // write value
    it = kVarray.cbegin();
    while (it != kVarray.cend()) {
        out.write(it->second.c_str(), static_cast<int32_t>(it->second.length() * sizeof (char)));

        ++it;
    }

    if (!out.good()) {
        std::cerr << "ERROR: Fail to write KVarray." << std::endl;
        exit(1);
    }
    out.close();

    return newCell;
}

std::vector<uint64_t> ssTableCacheCell::getKeyArray() {
#ifndef storeKeyOffset
    return getKeyArrayWithoutKVArray();
#else
    std::vector<uint64_t> res;
    if (indexArray == nullptr) {
        return res;
    }

    for (uint32_t i = 0; i < header.keyNumber; ++i) {
        res.emplace_back(indexArray[i].first);
    }

    return res;
#endif
}

std::string ssTableCacheCell::getValueNoExcept(uint32_t ind) const {
#ifndef storeKeyOffset
    return getValueNoExceptWithoutKVArray(ind);
#else
    std::string res;

    std::ifstream in;

    in.open(filePath, std::ios_base::in | std::ios_base::binary);
    if (!in.is_open()) {
        std::cerr << "ERROR: Fail to open file." << std::endl;
        exit(1);
    }

    uint32_t startOff = (indexArray[ind]).second;
    uint32_t endOff;

    if (uint64_t (ind) == header.keyNumber - 1) {
        in.seekg(0, std::ios_base::end);
        endOff = in.tellg();
    } else {
        endOff = (indexArray[ind + 1]).second;
    }

    char *tmp = new char [endOff - startOff];

    in.seekg(startOff, std::ios_base::beg);
    in.read(tmp, static_cast<int32_t>((endOff - startOff) * sizeof (char)));
    res = std::string(tmp, endOff - startOff);

    if (!in.good()) {
        std::cerr << "ERROR: Fail to read values." << std::endl;
        exit(1);
    }

    delete [] tmp;
    in.close();

    return res;
#endif
}

std::pair<bool, std::string> ssTableCacheCell::getValueWithoutKVArray(uint64_t key) const {
    std::pair<bool, std::string> res(false, "");
    // filter will return true without initialization
    if (key > header.maxKey || key < header.minKey || !filter.judgeKey(key)) {
        return res;
    }
    uint64_t curKey;

    std::ifstream in;
    in.open(filePath, std::ios_base::in | std::ios_base::binary);
    if (!in.is_open()) {
        std::cerr << "ERROR: Fail to open file." << std::endl;
        exit(1);
    }

    in.seekg(ssTableHeader::HEADER_SIZE + bloomFilter::FILTER_SIZE, std::ios_base::beg);

    uint64_t i;
    for (i = 0; i < header.keyNumber; ++i) {
        in.read((char *) &curKey, sizeof (uint64_t));
        if (curKey == key) {
            res.first = true;
            break;
        }
        in.seekg(sizeof (uint32_t), std::ios_base::cur);
    }

    if (res.first) {
        uint32_t startOff;
        uint32_t endOff;

        in.read((char *) &startOff, sizeof (uint32_t));
        if (i + 1 == header.keyNumber) {
            in.seekg(0, std::ios_base::end);
            endOff = in.tellg();
        } else {
            in.seekg(sizeof (uint64_t), std::ios_base::cur);
            in.read((char *) &endOff, sizeof (uint32_t));
        }

        char *tmp = new char [endOff - startOff];

        in.seekg(startOff, std::ios_base::beg);
        in.read(tmp, static_cast<int32_t>((endOff - startOff) * sizeof (char)));
        res.second = std::string(tmp, endOff - startOff);

        delete [] tmp;
    }

    if (!in.good()) {
        std::cerr << "ERROR: Fail to read KVArray." << std::endl;
        exit(1);
    }

    in.close();
    return res;
}

std::vector<uint64_t> ssTableCacheCell::getKeyArrayWithoutKVArray() {
    std::vector<uint64_t> res(header.keyNumber);

    std::ifstream in;
    in.open(filePath, std::ios_base::in | std::ios_base::binary);
    if (!in.is_open()) {
        std::cerr << "ERROR: Fail to open file." << std::endl;
        exit(1);
    }

    in.seekg(ssTableHeader::HEADER_SIZE + bloomFilter::FILTER_SIZE, std::ios_base::beg);

    for (uint64_t i = 0; i < header.keyNumber; ++i) {
        in.read((char *) &(res[i]), sizeof (uint64_t));
        in.seekg(sizeof (uint32_t), std::ios_base::cur);
    }

    if (!in.good()) {
        std::cerr << "ERROR: Fail to read KVArray." << std::endl;
        exit(1);
    }

    in.close();
    return res;
}

std::string ssTableCacheCell::getValueNoExceptWithoutKVArray(uint32_t ind) const {
    std::string res;

    std::ifstream in;
    in.open(filePath, std::ios_base::in | std::ios_base::binary);
    if (!in.is_open()) {
        std::cerr << "ERROR: Fail to open file." << std::endl;
        exit(1);
    }

    uint32_t offset = ssTableHeader::HEADER_SIZE + bloomFilter::FILTER_SIZE +
                        ind * (sizeof (uint64_t) + sizeof (uint32_t)) + sizeof (uint64_t);
    in.seekg(offset, std::ios_base::beg);

    uint32_t startOff;
    uint32_t endOff;

    in.read((char *) &startOff, sizeof (uint32_t));
    if (ind + 1 == header.keyNumber) {
        in.seekg(0, std::ios_base::end);
        endOff = in.tellg();
    } else {
        in.seekg(sizeof (uint64_t), std::ios_base::cur);
        in.read((char *) &endOff, sizeof (uint32_t));
    }

    char *tmp = new char [endOff - startOff];

    in.seekg(startOff, std::ios_base::beg);
    in.read(tmp, static_cast<int32_t>((endOff - startOff) * sizeof (char)));
    res = std::string(tmp, endOff - startOff);

    delete [] tmp;

    if (!in.good()) {
        std::cerr << "ERROR: Fail to read KVArray." << std::endl;
        exit(1);
    }

    in.close();
    return res;
}


