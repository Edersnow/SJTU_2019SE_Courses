#pragma once

#include <cstdint>
#include <string>

class bloomFilter {
public:
    // Size of filter (bytes)
    const static uint64_t FILTER_SIZE = 10240;

private:
    void *filter;

public:
    // constructor
    bloomFilter();

    // disable copy function
    bloomFilter(const bloomFilter &) = delete;
    bloomFilter &operator = (const bloomFilter &) = delete;

    // move constructor
    bloomFilter(bloomFilter &&) noexcept;

    // destructor
    ~bloomFilter();

    // set initialize
    void initialize();

    // add new key to filter
    void addNewKey(uint64_t key);

    // judge a given key (MAY BE NOT EXISTENT EVEN IF THIS FUNCTION RETURN TRUE)
    bool judgeKey(uint64_t key) const;

    // set filter pointer (from files)
    void readFilter(const std::string &filePath, uint32_t startPoint);

    // write filter to files (append mode)
    void writeFilter(const std::string& filePath) const;

    // just for test
    void setFilterNull();
};

