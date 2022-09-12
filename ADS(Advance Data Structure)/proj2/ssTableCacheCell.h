#pragma once

#include <string>
#include <vector>
#include "ssTableHeader.h"
#include "bloomFilter.h"

#define storeKeyOffset
#define storeBloomFilter

class ssTableCache;

class ssTableCacheCell {
    friend class ssTableCache;

private:
    ssTableHeader header;
    bloomFilter filter;
    std::pair<uint64_t, uint32_t> *indexArray;
    std::string filePath;

    // recursive find the given key
    // return -1 if the key doesn't exist
    // otherwise return the index
    int64_t find(uint64_t key, uint32_t l, uint32_t r) const;

    std::vector<uint64_t> getKeyArray ();

    std::string getValueNoExcept (uint32_t ind) const;

    //special functions for the test
    std::pair<bool, std::string> getValueWithoutKVArray(uint64_t key) const;
    std::vector<uint64_t> getKeyArrayWithoutKVArray ();
    std::string getValueNoExceptWithoutKVArray (uint32_t ind) const;

public:
    // constructor
    ssTableCacheCell(): indexArray(nullptr) {}

    // destructor
    ~ssTableCacheCell();

    // disable copy constructor
    ssTableCacheCell(const ssTableCacheCell &) = delete;
    ssTableCacheCell &operator = (const ssTableCacheCell &) = delete;

    // enable move constructor
    ssTableCacheCell(ssTableCacheCell &&) noexcept;

    // read cell
    void readCacheCell(const std::string &filePath);

    // try get value, exist -> (true, value), otherwise -> (false, "")
    // !ATTENTION: also return true if the value is "~DELETED~"
    std::pair<bool, std::string> getValue(uint64_t key) const;

    // delete this ssTable
    void deleteSsTable();

    // return something ...
    uint64_t getTimeStamp() const {return header.timeStamp;}
    uint64_t getMinKey() const {return header.minKey;}
    uint64_t getMaxKey() const {return header.maxKey;}

    // tool function
    static ssTableCacheCell *Generator (const std::string &filePath, uint64_t timeStamp,
                                        const std::vector<std::pair<uint64_t, std::string>> &kVarray);

};


