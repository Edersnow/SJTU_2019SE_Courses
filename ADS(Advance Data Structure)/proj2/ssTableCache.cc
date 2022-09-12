#include <fstream>
#include <iostream>
#include <algorithm>
#include <queue>
#include "utils.h"
#include "ssTableCache.h"

std::vector<ssTableCache::sortItem> ssTableCache::sortItemArrayGenerator(std::vector<uint64_t> &&keyArray, ssTableCacheCell *cell) {
    std::vector<ssTableCache::sortItem> res;

    res.reserve(keyArray.size());
    for (uint32_t i = 0; i < keyArray.size(); ++i) {
        res.emplace_back(keyArray[i], i, cell);
    }

    return res;
}

void ssTableCache::merge(std::vector<sortItem> &array, uint64_t start, uint64_t mid, uint64_t end) {
    uint64_t i = start, j = mid + 1, k = 0;
    std::vector<sortItem> tmpArray(end - start + 1);
    while (i <= mid && j <= end) {
        if (array[i].key > array[j].key)  tmpArray[k++] = array[j++];
        else  tmpArray[k++] = array[i++];
    }
    while (i <= mid)  tmpArray[k++] = array[i++];
    while (j <= end)  tmpArray[k++] = array[j++];
    for (i = start, k = 0; i <= end; ++i, ++k) {
        array[i] = tmpArray[k];
    }
}

void ssTableCache::mergesort(std::vector<sortItem> &array, uint64_t start, uint64_t end) {
    uint64_t mid = (start + end) >> 1;
    if (end <= start)  return;
    mergesort(array, start, mid);
    mergesort(array, mid + 1, end);
    merge(array, start, mid, end);
}

void ssTableCache::compaction(uint32_t targetLevel, std::vector<ssTableCacheCell *> &targetCells, const std::string &DELETE_FLAG) {
    std::vector<sortItem> array;
    std::vector<sortItem> uniqueArray;

    // get sortItems
    for (auto &it: targetCells) {
        auto tmp = sortItemArrayGenerator(it->getKeyArray(), it);
        array.insert(array.cend(), tmp.cbegin(), tmp.cend());
    }

    mergesort(array, 0, array.size() - 1);

    uint32_t lastInd = 0;

    // get unique sortItem
    for (uint32_t i = 1; i < array.size(); ++i) {
        if (array[i].key != array[lastInd].key) {
            uniqueArray.emplace_back(array[lastInd]);
            lastInd = i;
        } else {
            if (array[i].cell->getTimeStamp() > array[lastInd].cell->getTimeStamp()) {
                lastInd = i;
            }
        }
    }
    uniqueArray.emplace_back(array[lastInd]);

    array.clear();

    std::vector<std::pair<uint64_t, std::string>> tmp;
    const uint32_t MAX_SIZE = 2 * 1024 * 1024 - ssTableHeader::HEADER_SIZE - bloomFilter::FILTER_SIZE;
    uint64_t tmpTimeStamp = 0;
    uint32_t tmpSize = 0;
    bool needHandleDeleteFlag = targetLevel >= levelArray.size() - 1;

    // add new cells
    for (auto &it: uniqueArray) {
        std::string val = it.cell->getValueNoExcept(it.ind);

        if (needHandleDeleteFlag && val == DELETE_FLAG) {
            continue;
        }

        if (tmpSize + val.size() + sizeof (uint64_t) + sizeof (uint32_t) > MAX_SIZE) {
            std::string targetDir = filePath + "/" + DIRECTORY_PREFIX + std::to_string(targetLevel);
            if (!utils::dirExists(targetDir)) {
                if (utils::mkdir(targetDir.c_str())) {
                    std::cerr << "ERROR: Fail to create directory." << std::endl;
                    exit(1);
                }
                levelArray.emplace_back();
                nextLabel.push_back(0);
            }

            std::string fileName = targetDir + '/' + std::to_string(nextLabel[targetLevel]) + FILE_SUFFIX;
            levelArray[targetLevel].emplace_back(ssTableCacheCell::Generator(fileName, tmpTimeStamp, tmp));

            ++nextLabel[targetLevel];

            tmp.clear();
            tmpTimeStamp = 0;
            tmpSize = 0;
        }

        tmp.emplace_back(it.key, val);
        tmpSize += val.size() + sizeof (uint64_t) + sizeof (uint32_t);
        if (it.cell->getTimeStamp() > tmpTimeStamp) {
            tmpTimeStamp = it.cell->getTimeStamp();
        }
    }
    if (!tmp.empty()) {
        std::string targetDir = filePath + "/" + DIRECTORY_PREFIX + std::to_string(targetLevel);
        if (!utils::dirExists(targetDir)) {
            if (utils::mkdir(targetDir.c_str())) {
                std::cerr << "ERROR: Fail to create directory." << std::endl;
                exit(1);
            }
            levelArray.emplace_back();
            nextLabel.push_back(0);
        }

        std::string fileName = targetDir + '/' + std::to_string(nextLabel[targetLevel]) + FILE_SUFFIX;
        levelArray[targetLevel].emplace_back(ssTableCacheCell::Generator(fileName, tmpTimeStamp, tmp));

        ++nextLabel[targetLevel];

        tmp.clear();
    }

    // delete old cells
    for (auto &it: targetCells) {
        it->deleteSsTable();
        delete it;
        it = nullptr;
    }
}

void ssTableCache::justify(const std::string &DELETE_FLAG) {
    uint32_t levelNum = 0;
    while (levelNum < levelArray.size() && levelArray[levelNum].size() > MAX_SIZE(levelNum)) {
        std::vector<ssTableCacheCell *> targetCells;
        uint64_t minKey;
        uint64_t maxKey;

        if (levelNum == 0) {
            minKey = levelArray[0][0]->getMinKey();
            maxKey = levelArray[0][0]->getMaxKey();
            for (auto &it: levelArray[0]) {
                targetCells.emplace_back(it);
                minKey = std::min(minKey, it->getMinKey());
                maxKey = std::max(maxKey, it->getMaxKey());
            }

            levelArray[0].clear();
        } else {
            std::deque<ssTableCacheCell *> &tmpCells = levelArray[levelNum];
            std::priority_queue<priorityItem, std::vector<priorityItem>, std::greater<>> que;
            for (uint32_t i = 0; i < tmpCells.size(); ++i) {
                que.emplace(tmpCells[i]->getTimeStamp(), tmpCells[i]->getMinKey(), tmpCells[i]->getMaxKey(), i, tmpCells[i]);
            }

            minKey = que.top().minKey;
            maxKey = que.top().maxKey;

            std::vector<uint32_t> deleteList;
            uint32_t n = tmpCells.size() - MAX_SIZE(levelNum);
            while (n--) {
                targetCells.emplace_back(que.top().cell);
                deleteList.emplace_back(que.top().index);
                minKey = std::min(minKey, que.top().minKey);
                maxKey = std::max(maxKey, que.top().maxKey);
                que.pop();
            }

            std::sort(deleteList.begin(), deleteList.end());

            auto iter = tmpCells.begin();
            uint32_t iterTimes = deleteList[0];
            while (iterTimes--)  ++iter;
            iter = tmpCells.erase(iter);
            for (uint32_t i = 1; i < deleteList.size(); ++i) {
                iterTimes = deleteList[i] - deleteList[i - 1] - 1;
                while (iterTimes--)  ++iter;
                iter = tmpCells.erase(iter);
            }
        }

        if (levelNum + 1 < levelArray.size()) {
            std::deque<ssTableCacheCell *> &tmpCells = levelArray[levelNum + 1];
            auto iter = tmpCells.begin();
            while (iter != tmpCells.end()) {
                if (minKey <= (*iter)->getMaxKey() && maxKey >= (*iter)->getMinKey()) {
                    targetCells.emplace_back(*iter);
                    iter = tmpCells.erase(iter);
                } else {
                    ++iter;
                }
            }
        }

        compaction(levelNum + 1, targetCells, DELETE_FLAG);

        ++levelNum;
    }
}

ssTableCache::ssTableCache(std::string f): filePath(std::move(f)){
    if (!utils::dirExists(filePath) && utils::mkdir(filePath.c_str())) {
        std::cerr << "ERROR: Fail to create directory." << std::endl;
        exit(1);
    }

    uint64_t levelNum = 0;
    std::string subDir;
    nextTimeStamp = 1;

    while (utils::dirExists(subDir = filePath + "/" + DIRECTORY_PREFIX + std::to_string(levelNum))) {
        uint64_t fileNum;
        uint64_t nextFileNum = 0;

        std::vector<std::string> ret;
        utils::scanDir(subDir, ret);

        levelArray.emplace_back();
        std::deque<ssTableCacheCell *> &ssTableArray = levelArray[levelArray.size() - 1];

        for (const auto &it: ret) {
            std::string subFile = subDir;
            subFile += "/" + it;

            ssTableArray.push_back(new ssTableCacheCell);
            ssTableArray[ssTableArray.size() - 1]->readCacheCell(subFile);

            uint64_t tmp = ssTableArray[ssTableArray.size() - 1]->getTimeStamp();
            if (tmp >= nextTimeStamp)  nextTimeStamp = tmp + 1;

            fileNum = stoul(it.substr(0, it.find('.')));
            if (nextFileNum <= fileNum) {
                nextFileNum = fileNum + 1;
            }
        }

        nextLabel.push_back(nextFileNum);

        ++levelNum;
    }

    if (levelArray.empty()) {
        if ( utils::mkdir((filePath + "/" + DIRECTORY_PREFIX + "0").c_str()) ) {
            std::cerr << "ERROR: Fail to create directory." << std::endl;
            exit(1);
        }
        levelArray.emplace_back();
        nextLabel.push_back(0);
    }
}

ssTableCache::~ssTableCache() {
    for (auto & it : levelArray) {
        for (auto & item : it) {
            delete item;
            item = nullptr;
        }
    }
}

void ssTableCache::addSsTableCell(const std::vector<std::pair<uint64_t, std::string>> &kVarray, const std::string &DELETE_FLAG) {
    std::string fileName = filePath + "/" + DIRECTORY_PREFIX + "0/" + std::to_string(nextLabel[0]) + FILE_SUFFIX;
    levelArray[0].emplace_back(ssTableCacheCell::Generator(fileName, nextTimeStamp, kVarray));
    ++nextTimeStamp;
    ++nextLabel[0];

    justify(DELETE_FLAG);
}

std::pair<bool, std::string> ssTableCache::get(uint64_t key) const {
    std::pair<bool, std::string> res(false, "");
    uint64_t maxTimeStamp;

    if (!levelArray.empty()) {
        // special: find in level 0
        for (const auto &it: levelArray[0]) {
            std::pair<bool, std::string> test = it->getValue(key);
            if (test.first) {
                if (res.first) {
                    if (maxTimeStamp < it->getTimeStamp()) {
                        maxTimeStamp = it->getTimeStamp();
                        res.second = test.second;
                    }
                } else {
                    maxTimeStamp = it->getTimeStamp();
                    res.first = true;
                    res.second = test.second;
                }
            }
        }
        if (res.first) {
            return res;
        }

        uint64_t i = 1;
        while (i < levelArray.size()) {
            for (const auto &it: levelArray[i]) {
                std::pair<bool, std::string> test = it->getValue(key);
                if (test.first) {
                    res.first = true;
                    res.second = test.second;
                    return res;
                }
            }
            ++i;
        }
    }

    return res;
}

void ssTableCache::reset() {
    for (auto & it : levelArray) {
        for (auto & item : it) {
            item->deleteSsTable();
            delete item;
            item = nullptr;
        }
        it.clear();
    }

    for (uint64_t i = 0; i < levelArray.size(); ++i) {
        if( utils::rmdir((filePath + "/" + DIRECTORY_PREFIX + std::to_string(i)).c_str()) ) {
            std::cerr << "ERROR: Fail to delete directory." << std::endl;
            exit(1);
        }
    }
    levelArray.clear();
    nextLabel.clear();

    if ( utils::mkdir((filePath + "/" + DIRECTORY_PREFIX + "0").c_str()) ) {
        std::cerr << "ERROR: Fail to create directory." << std::endl;
        exit(1);
    }
    levelArray.emplace_back();
    nextLabel.push_back(0);
    nextTimeStamp = 1;
}
