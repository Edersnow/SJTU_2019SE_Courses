#pragma once

#include <utility>
#include <string>
#include <vector>
#include "ssTableCacheCell.h"

class skipList{
private:
    struct skipListNode{
        skipListNode *right;
        skipListNode *down;
        uint64_t key;
        std::string val;

        // the value "0" should never be used
        skipListNode(): right(nullptr), down(nullptr), key(0) {}
        skipListNode(skipListNode *r, skipListNode *d, uint64_t k, std::string v): right(r), down(d), key(k), val(std::move(v)) {}
    };
    // maximum size (Bytes) excludes Header & Bloom Filter
    const static uint32_t MAX_SIZE = 2 * 1024 * 1024 - ssTableHeader::HEADER_SIZE - bloomFilter::FILTER_SIZE;


    // current size
    uint32_t size;
    // head node
    skipListNode *head;


    // get the nodes that contains the max k < key
    std::vector<skipListNode *> getLeftPath(uint64_t key) const;

public:
    // constructor
    skipList();

    // destructor
    ~skipList();

    // return false if current size > MAX_SIZE after insert
    bool put(uint64_t key, const std::string &s);

    // return (false, "") if the key doesn't exist, otherwise (true, val)
    // !ATTENTION: also return true if the value is "~DELETED~"
    std::pair<bool, std::string> get(uint64_t key) const ;

    // return (false, "") if the key doesn't exist, otherwise (true, val)
    // !ATTENTION: also return true if the value is "~DELETED~"
    std::pair<bool, std::string> del(uint64_t key);

    std::vector<std::pair<uint64_t, std::string>> getKVList () const;

    bool empty() const {return size == 0;}

    // clear all data
    void clear();
};