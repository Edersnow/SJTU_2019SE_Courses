#include <iostream>
#include "kvstore.h"

KVStore::KVStore(const std::string &dir): KVStoreAPI(dir), ssTables(dir) {

}

KVStore::~KVStore() {
    if (!memTable.empty()) {
        std::vector<std::pair<uint64_t, std::string>> tmp = memTable.getKVList();
        ssTables.addSsTableCell(tmp, DELETE_FLAG);
        memTable.clear();
    }
}

/**
 * Insert/Update the key-value pair.
 * No return values for simplicity.
 */
void KVStore::put(uint64_t key, const std::string &s) {
    if (!memTable.put(key, s)) {
        if (memTable.empty()) {
            std::cout << "Insert failure: the value is too large to insert." << std::endl;
            return;
        }

        std::vector<std::pair<uint64_t, std::string>> tmp = memTable.getKVList();
        ssTables.addSsTableCell(tmp, DELETE_FLAG);
        memTable.clear();

        if (!memTable.put(key, s)) {
            std::cout << "Insert failure: the value is too large to insert." << std::endl;
        }
    }
}
/**
 * Returns the (string) value of the given key.
 * An empty string indicates not found.
 */
std::string KVStore::get(uint64_t key)
{
    std::pair<bool, std::string> testGet = memTable.get(key);
    if (testGet.first) {
        if (testGet.second == DELETE_FLAG) {
            return "";
        }
        return testGet.second;
    }

    testGet = ssTables.get(key);
    if (testGet.first && testGet.second != DELETE_FLAG) {
        return testGet.second;
    }
	return "";
}
/**
 * Delete the given key-value pair if it exists.
 * Returns false iff the key is not found.
 */
bool KVStore::del(uint64_t key) {
    std::pair<bool, std::string> res = memTable.del(key);
    put(key, DELETE_FLAG);

    if (res.first) {
        if (res.second == DELETE_FLAG) {
            return false;
        }
        return true;
    }
    res = ssTables.get(key);
    if (res.first && res.second == DELETE_FLAG) {
        return false;
    }

	return true;
}

/**
 * This resets the kvStore. All key-value pairs should be removed,
 * including memTable and all ssTables files.
 */
void KVStore::reset() {
    memTable.clear();
    ssTables.reset();
}
