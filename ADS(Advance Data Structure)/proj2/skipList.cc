#include <random>
#include <chrono>
#include <fstream>
#include "skipList.h"
#include "ssTableHeader.h"

// FOR DEBUG
#include <iostream>

std::vector<skipList::skipListNode *> skipList::getLeftPath(uint64_t key) const {
    std::vector<skipListNode *> res;
    skipListNode *p = head;

    while (p) {
        while (p->right && p->right->key < key) {
            p = p->right;
        }
        res.push_back(p);
        p = p->down;
    }

    return res;
}

skipList::skipList() {
    size = 0;
    head = new skipListNode;
}

bool skipList::put(uint64_t key, const std::string &s){
    std::vector<skipListNode *> leftPath(getLeftPath(key));

    if (leftPath.back()->right && leftPath.back()->right->key == key) {
        // try add size
        uint64_t oldSize = size;
        size = size + s.length() * sizeof (char) - leftPath.back()->val.length() * sizeof (char);
        if (size > MAX_SIZE) {
            size = oldSize;
            return false;
        }

        // replace old val
        while (!leftPath.empty()) {
            skipListNode *p = leftPath.back()->right;
            if (!p || p->key != key) {
                break;
            }
            p->val = s;
            leftPath.pop_back();
        }

    } else {
        // try add size
        uint64_t oldSize = size;
        size = size + s.length() * sizeof (char) + sizeof (uint64_t) + sizeof (uint32_t);
        if (size > MAX_SIZE) {
            size = oldSize;
            return false;
        }

        // add new val
        skipListNode *lastNode = nullptr;
        static std::default_random_engine e(std::chrono::steady_clock::now().time_since_epoch().count());
        static std::uniform_int_distribution<uint8_t> u(0, 1);
        bool needAdd = true;

        while (!leftPath.empty() && needAdd) {
            skipListNode *p = leftPath.back();
            p->right = new skipListNode (p->right, lastNode, key, s);

            lastNode = p->right;
            needAdd = u(e);
            leftPath.pop_back();
        }
        if (leftPath.empty() && needAdd) {
            head = new skipListNode (new skipListNode (nullptr, lastNode, key, s), head, 0, std::string());
        }
    }

    return true;
}

std::pair<bool, std::string> skipList::get(uint64_t key) const {
    std::vector<skipListNode *> leftPath(getLeftPath(key));
    std::pair<bool, std::string> res(false, "");

    if (leftPath.back()->right && leftPath.back()->right->key == key) {
        res.first = true;
        res.second = leftPath.back()->right->val;
    }

    return res;
}

std::pair<bool, std::string> skipList::del(uint64_t key){
    std::vector<skipListNode *> leftPath(getLeftPath(key));
    std::pair<bool, std::string> res(false, "");

    if (leftPath.back()->right && leftPath.back()->right->key == key) {
        res.first = true;
        res.second = leftPath.back()->right->val;

        // cal space count
        size = size - leftPath.back()->right->val.length() * sizeof (char) - sizeof (uint64_t) - sizeof (uint32_t);

        // delete the key
        while (!leftPath.empty()) {
            skipListNode *p = leftPath.back();
            skipListNode *toBeDeleted = p->right;
            if (!toBeDeleted || toBeDeleted->key != key) {
                break;
            }

            p->right = toBeDeleted->right;
            delete toBeDeleted;
            leftPath.pop_back();
        }
    }

    return res;
}

std::vector<std::pair<uint64_t, std::string>> skipList::getKVList() const {
    std::vector<std::pair<uint64_t, std::string>> res;
    if (size == 0) {
        return res;
    }

    skipListNode *p = head;
    while (p->down)  p = p->down;

    while (p->right) {
        p = p->right;
        res.emplace_back(p->key, p->val);
    }
    return res;
}

void skipList::clear() {
    size = 0;

    skipListNode *p = head;
    while (p) {
        skipListNode *q = p->right;
        while (q) {
            skipListNode *toBeDeleted = q;
            q = q->right;
            delete toBeDeleted;
        }
        p = p->down;
    }

    p = head;
    while (p) {
        skipListNode *toBeDeleted = p;
        p = p->down;
        delete toBeDeleted;
    }

    head = new skipListNode;
}

skipList::~skipList() {
    skipListNode *p = head;
    while (p) {
        skipListNode *q = p->right;
        while (q) {
            skipListNode *toBeDeleted = q;
            q = q->right;
            delete toBeDeleted;
        }
        p = p->down;
    }

    p = head;
    while (p) {
        skipListNode *toBeDeleted = p;
        p = p->down;
        delete toBeDeleted;
    }
}


