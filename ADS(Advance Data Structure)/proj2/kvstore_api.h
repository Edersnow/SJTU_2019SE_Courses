#pragma once

#include <cstdint>
#include <string>

class KVStoreAPI {
public:
	/**
	 * You should put all ssTables under `dir`.
	 * Please create one sub-directory for each level, and put ssTables
	 * there. Please refer to the c++ filesystem library
	 * (https://en.cppreference.com/w/cpp/filesystem).
	 */
	explicit KVStoreAPI(const std::string &dir) { }
	KVStoreAPI() = delete;

	/**
	 * Insert/Update the key-value pair.
	 * No return values for simplicity.
	 */
	virtual void put(uint64_t key, const std::string &s) = 0;

	/**
	 * Returns the (string) value of the given key.
	 * An empty string indicates not found.
	 */
	virtual std::string get(uint64_t key) = 0;

	/**
	 * Delete the given key-value pair if it exists.
	 * Returns false iff the key is not found.
	 */
	virtual bool del(uint64_t key) = 0;

	/**
	 * This resets the kvStore. All key-value pairs should be removed,
	 * including memTable and all ssTables files.
	 */
	virtual void reset() = 0;
};

