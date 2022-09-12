#include "chdb_state_machine.h"

chdb_command::chdb_command() :chdb_command(CMD_NONE, 0, 0, 0) {

}

chdb_command::chdb_command(command_type tp, const int &key, const int &value, const int &tx_id)
        : cmd_tp(tp), key(key), value(value), tx_id(tx_id), res(std::make_shared<result>()) {
    res->start = std::chrono::system_clock::now();
    res->key = key;
}

chdb_command::chdb_command(const chdb_command &cmd) :
        cmd_tp(cmd.cmd_tp), key(cmd.key), value(cmd.value), tx_id(cmd.tx_id), res(cmd.res) {
    
}


void chdb_command::serialize(char *buf, int size) const {
    // TODO: Your code here
    int pos = 0;

    memcpy(buf + pos, (char *) &cmd_tp, sizeof(command_type));
    pos += sizeof(command_type);
    memcpy(buf + pos, (char *) &key, sizeof(int));
    pos += sizeof(int);
    memcpy(buf + pos, (char *) &value, sizeof(int));
    pos += sizeof(int);
    memcpy(buf + pos, (char *) &tx_id, sizeof(int));
}

void chdb_command::deserialize(const char *buf, int size) {
    // TODO: Your code here
    int pos = 0;

    memcpy((char *) &cmd_tp, buf + pos, sizeof(command_type));
    pos += sizeof(command_type);
    memcpy((char *) &key, buf + pos, sizeof(int));
    pos += sizeof(int);
    memcpy((char *) &value, buf + pos, sizeof(int));
    pos += sizeof(int);
    memcpy((char *) &tx_id, buf + pos, sizeof(int));
}

marshall &operator<<(marshall &m, const chdb_command &cmd) {
    // TODO: Your code here
    m << (int)cmd.cmd_tp << cmd.key << cmd.value << cmd.tx_id;
    return m;
}

unmarshall &operator>>(unmarshall &u, chdb_command &cmd) {
    // TODO: Your code here
    int type;
    u >> type >> cmd.key >> cmd.value >> cmd.tx_id;
    cmd.cmd_tp = chdb_command::command_type(type);
    return u;
}

void chdb_state_machine::apply_log(raft_command &cmd) {
    // TODO: Your code here
    chdb_command &chdb_cmd = dynamic_cast<chdb_command &>(cmd);
    std::unique_lock <std::mutex> lock(chdb_cmd.res->mtx);

    chdb_cmd.res->done = true;
    if (chdb_cmd.cmd_tp == chdb_command::command_type::CMD_GET) {
        auto it2 = state.find(chdb_cmd.key);
        if (it2 != state.end()) {
            chdb_cmd.res->succ = true;
            chdb_cmd.res->key = chdb_cmd.key;
            chdb_cmd.res->value = it2->second;
        }
        else {
            chdb_cmd.res->succ = false;
            chdb_cmd.res->key = chdb_cmd.key;
            chdb_cmd.res->value = 0;
        }
        chdb_cmd.res->tx_id = chdb_cmd.tx_id;
    }
    else if (chdb_cmd.cmd_tp == chdb_command::command_type::CMD_PUT) {
        auto it3 = state.find(chdb_cmd.key);
        if (it3 == state.end()) {
            chdb_cmd.res->succ = true;
            chdb_cmd.res->key = chdb_cmd.key;
            chdb_cmd.res->value = chdb_cmd.value;
        }
        else {
            chdb_cmd.res->succ = false;
            chdb_cmd.res->key = chdb_cmd.key;
            chdb_cmd.res->value = it3->second;
        }
        chdb_cmd.res->tx_id = chdb_cmd.tx_id;
        state[chdb_cmd.key] = chdb_cmd.value;
    }
    else {
        chdb_cmd.res->succ = true;
    }

    chdb_cmd.res->cv.notify_all();
    return;
}