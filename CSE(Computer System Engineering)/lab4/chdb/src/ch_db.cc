#include "ch_db.h"

int view_server::execute(unsigned int query_key, unsigned int proc, const chdb_protocol::operation_var &var, int &r) {
    // TODO: Your code here
    int base_port = this->node->port();
    int shard_offset = this->dispatch(query_key, shard_num());

    return this->node->template call(base_port + shard_offset, proc, var, r);
}

int view_server::execute(unsigned int shard_client_id, unsigned int proc, const chdb_protocol::prepare_var &var, int &r) {
    int base_port = this->node->port();
    int shard_offset = shard_client_id;

    return this->node->template call(base_port + shard_offset, proc, var, r);
}

int view_server::execute(unsigned int shard_client_id, unsigned int proc, const chdb_protocol::check_prepare_state_var &var, int &r) {
    int base_port = this->node->port();
    int shard_offset = shard_client_id;

    return this->node->template call(base_port + shard_offset, proc, var, r);
}

int view_server::execute(unsigned int shard_client_id, unsigned int proc, std::list<chdb_command> cmd_list, const chdb_protocol::commit_var &var, int &r) {
    int base_port = this->node->port();
    int shard_offset = shard_client_id;

    auto cur_leader = leader();
    int before = cur_leader->applied_log_num();
    for (auto &it : cmd_list) {
        int i, j;
        cur_leader->new_command(it, i, j);
    }
    while (true) {
        int after = cur_leader->applied_log_num();
        if (after - before != cmd_list.size()) {
            mssleep(12);
        }
        else {
            break;
        }
    }
    
    return this->node->template call(base_port + shard_offset, proc, var, r);
}

int view_server::execute(unsigned int query_key, unsigned int proc, const chdb_protocol::rollback_var &var, int &r) {
    int base_port = this->node->port();
    int shard_offset = this->dispatch(query_key, shard_num());

    return this->node->template call(base_port + shard_offset, proc, var, r);
}

view_server::~view_server() {
#if RAFT_GROUP
    delete this->raft_group;
#endif
    delete this->node;

}