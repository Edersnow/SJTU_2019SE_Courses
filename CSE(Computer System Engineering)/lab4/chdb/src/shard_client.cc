#include "shard_client.h"


int shard_client::put(chdb_protocol::operation_var var, int &r) {
    // TODO: Your code here
    value_entry val;
    val.value = var.value;
    tx_store[var.tx_id][var.key] = val;

    return 0;
}

int shard_client::get(chdb_protocol::operation_var var, int &r) {
    // TODO: Your code here
    if (tx_store.count(var.tx_id) && tx_store[var.tx_id].count(var.key)) {
        r = tx_store[var.tx_id][var.key].value;
    }
    else if (store[primary_replica].count(var.key)) {
        r = store[primary_replica][var.key].value;
    }
    else {
        // undefined behavior
        r = 0;
    }
    return 0;
}

int shard_client::commit(chdb_protocol::commit_var var, int &r) {
    // TODO: Your code here
    for (auto &it : tx_store[var.tx_id]) {
        for (auto &iter : store) {
            iter[it.first] = it.second;
        }
    }
    tx_store.erase(var.tx_id);
    return 0;
}

int shard_client::rollback(chdb_protocol::rollback_var var, int &r) {
    // TODO: Your code here
    tx_store.erase(var.tx_id);
    return 0;
}

int shard_client::check_prepare_state(chdb_protocol::check_prepare_state_var var, int &r) {
    // TODO: Your code here
    if (tx_store.count(var.tx_id)) {
        r = active;
    }
    else {
        r = true;
    }
    return 0;
}

int shard_client::prepare(chdb_protocol::prepare_var var, int &r) {
    // TODO: Your code here
    if (tx_store.count(var.tx_id)) {
        r = active;
    }
    else {
        r = true;
    }
    return 0;
}

shard_client::~shard_client() {
    delete node;
}