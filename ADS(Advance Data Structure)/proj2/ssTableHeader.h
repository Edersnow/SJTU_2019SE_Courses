#pragma once

#include <cstdint>
#include <string>

class ssTableHeader {
public:
    static const uint32_t HEADER_SIZE = 32;

    uint64_t timeStamp;
    uint64_t keyNumber;
    uint64_t maxKey;
    uint64_t minKey;

    explicit ssTableHeader(uint64_t t = 0, uint64_t k = 0, uint64_t ma = 0, uint64_t mi = 0): timeStamp(t), keyNumber(k), maxKey(ma), minKey(mi){}

    void readHeader(const std::string& filePath, uint32_t startPoint);

    void writeHeader(const std::string& filePath) const;
};
