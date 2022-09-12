#pragma once

#include <string>
#include <deque>
#include <vector>
#include "ssTableCacheCell.h"

class ssTableCache {
private:
    struct sortItem {
        uint64_t key;
        uint32_t ind;
        ssTableCacheCell *cell;

        explicit sortItem(uint64_t k = 0, uint32_t i = 0, ssTableCacheCell *c = nullptr): key(k), ind(i), cell(c) {}
    };

    struct priorityItem {
        uint64_t timeStamp;
        uint64_t minKey;
        uint64_t maxKey;
        uint32_t index;
        ssTableCacheCell *cell;

        priorityItem(uint64_t t, uint64_t mi, uint64_t ma, uint64_t i, ssTableCacheCell *c)
            : timeStamp(t), minKey(mi), maxKey(ma), index(i), cell(c) {}
        bool operator > (const ssTableCache::priorityItem& other) const {
            return timeStamp > other.timeStamp || (timeStamp == other.timeStamp && minKey > other.minKey);
        }
    };

    static constexpr const char * DIRECTORY_PREFIX = "level-";
    static constexpr const char * FILE_SUFFIX = ".sst";

    std::string filePath;
    std::vector<std::deque<ssTableCacheCell *>> levelArray;
    std::vector<uint64_t> nextLabel;
    uint64_t nextTimeStamp;

    static inline uint64_t MAX_SIZE(uint64_t level) { return 0b10 << level; }

    static std::vector<sortItem> sortItemArrayGenerator(std::vector<uint64_t> &&keyArray, ssTableCacheCell *cell);

    static void merge(std::vector<sortItem> &array, uint64_t start, uint64_t mid, uint64_t end);

    static void mergesort(std::vector<sortItem> &array, uint64_t start, uint64_t end);

    void compaction(uint32_t targetLevel, std::vector<ssTableCacheCell *> &targetCells, const std::string &DELETE_FLAG);

    // justify the structure
    void justify(const std::string &DELETE_FLAG);

public:
    explicit ssTableCache(std::string f);

    ~ssTableCache();

    // add ssTable
    void addSsTableCell(const std::vector<std::pair<uint64_t, std::string>> &kVarray, const std::string &DELETE_FLAG);

    // get the key
    std::pair<bool, std::string> get(uint64_t key) const;

    void reset();
};



