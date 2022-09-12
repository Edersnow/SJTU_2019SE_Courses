#include "tx_region.h"


int tx_region::put(const int key, const int val) {
    // TODO: Your code here
    int r;

    std::unique_lock<std::mutex> lck(db->key_tx_mtx, std::defer_lock);
    lck.lock();
    while (db->key_tx_map.count(key) && db->key_tx_map[key] != tx_id) {
        db->cond.wait(lck);
    }
    db->key_tx_map[key] = tx_id;
    lck.unlock();

    cmd_list.push_back(chdb_command(chdb_command::CMD_PUT, key, val, tx_id));
    db->vserver->execute(key, 
                        chdb_protocol::Put, 
                        chdb_protocol::operation_var{.tx_id = tx_id, .key = key, .value = val},
                        r);
    return r;
}

int tx_region::get(const int key) {
    // TODO: Your code here
    int r;

    std::unique_lock<std::mutex> lck(db->key_tx_mtx, std::defer_lock);
    lck.lock();
    while (db->key_tx_map.count(key) && db->key_tx_map[key] != tx_id) {
        db->cond.wait(lck);
    }
    db->key_tx_map[key] = tx_id;
    lck.unlock();

    cmd_list.push_back(chdb_command(chdb_command::CMD_GET, key, 0, tx_id));
    db->vserver->execute(key, 
                        chdb_protocol::Get, 
                        chdb_protocol::operation_var{.tx_id = tx_id, .key = key},
                        r);
    return r;
}

int tx_region::tx_can_commit() {
    // TODO: Your code here
    for (auto &it : db->shards) {
        int r;
        db->vserver->execute(it->shard_id, chdb_protocol::Prepare, chdb_protocol::prepare_var{.tx_id = tx_id}, r);
        if (r == false) {
            return chdb_protocol::prepare_not_ok;
        }
    }
    return chdb_protocol::prepare_ok;
}

int tx_region::tx_begin() {
    // TODO: Your code here
    printf("tx[%d] begin\n", tx_id);
    return 0;
}

int tx_region::tx_commit() {
    // TODO: Your code here
    printf("tx[%d] commit\n", tx_id);
    for (auto &it : db->shards) {
        int r;
        db->vserver->execute(it->shard_id, chdb_protocol::Commit, cmd_list, chdb_protocol::commit_var{.tx_id = tx_id}, r);
    }

    std::unique_lock<std::mutex> lck(db->key_tx_mtx, std::defer_lock);
    lck.lock();
    std::list<int> to_be_deleted;
    for (auto &it : db->key_tx_map) {
        if (it.second == tx_id) {
            to_be_deleted.push_back(it.first);
        }
    }
    for (auto &it : to_be_deleted) {
        db->key_tx_map.erase(it);
    }
    lck.unlock();
    db->cond.notify_one();

    return 0;
}

int tx_region::tx_abort() {
    // TODO: Your code here
    printf("tx[%d] abort\n", tx_id);
    for (auto &it : db->shards) {
        int r;
        db->vserver->execute(it->shard_id, chdb_protocol::Rollback, chdb_protocol::rollback_var{.tx_id = tx_id}, r);
    }

    std::unique_lock<std::mutex> lck(db->key_tx_mtx, std::defer_lock);
    lck.lock();
    std::list<int> to_be_deleted;
    for (auto &it : db->key_tx_map) {
        if (it.second == tx_id) {
            to_be_deleted.push_back(it.first);
        }
    }
    for (auto &it : to_be_deleted) {
        db->key_tx_map.erase(it);
    }
    lck.unlock();
    db->cond.notify_one();

    return 0;
}
