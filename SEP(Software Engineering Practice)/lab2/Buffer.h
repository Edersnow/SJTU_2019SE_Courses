#pragma once

#include <string>

using std::string;

class Buffer {
private:
    struct node{
        string contents;
        node *next;

        node(): next(nullptr){}
        node(const string &other, node *nex): contents(other), next(nex){}
    };

    int **currentLineNum;
    // TODO: add a List here for storing the input lines
    int totalLen;
    node *head;

public:
    Buffer();
    ~Buffer();

    void writeToFile(const string &filename) const;

    const string &moveToLine(int idx) const;

    void showLines(int from, int to) const;

    void deleteLines(int from, int to);
    void insertLine(const string &text);
    void appendLine(const string &text);
};
