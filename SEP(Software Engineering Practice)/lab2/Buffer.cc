#include <fstream>
#include <iostream>
#include "Buffer.h"

//TODO: your code here
//implement the functions in ListBuffer

Buffer::Buffer(): totalLen(0) {
    head = new node();
    currentLineNum = new int*;
    *currentLineNum = new int (0);
}

Buffer::~Buffer() {
    node *del;
    node *poi=head->next;

    while (poi){
        del = poi;
        poi = poi->next;
        delete del;
    }

    head->next = nullptr;
    delete *currentLineNum;
    delete currentLineNum;
}

//noexcept
void Buffer::writeToFile(const string &filename) const {
    FILE *tmpfile = nullptr;
    node *poi=head->next;
    int totalnum = 0;

    tmpfile = fopen(filename.c_str(), "w");
    while (poi){
        totalnum += poi->contents.length();
        fputs(poi->contents.c_str(), tmpfile);
        fputc('\n', tmpfile);
        ++totalnum;
        poi = poi->next;
    }

    printf("%d byte(s) written\n", totalnum);
    fclose(tmpfile);
}

//throw >> Line number out of range
//special: throw >> Number range error
//to == -1 >> $
void Buffer::showLines(int from, int to) const {
    int num = from;
    node *poi = head->next;

    if (from <= 0 || to > totalLen){
        throw "Line number out of range";
    }

    if (to == -1 && totalLen == 0 && from == 1){
        throw "Number range error";
    }

    if (to == -1){
        to = totalLen;
    }

    while (--num){
        poi = poi->next;
    }

    while (from <= to){
        printf("%d\t%s\n", from, poi->contents.c_str());
        ++from;
        poi = poi->next;
    }

    **currentLineNum = to;
}

//throw >> Line number out of range
//to == -1 >> $
void Buffer::deleteLines(int from, int to){
    int num = from;
    node *poi = head;
    node *del;

    if (from <= 0 || to > totalLen){
        throw "Line number out of range";
    }

    if (to == -1){
        to = totalLen;
    }

    while (--num){
        poi = poi->next;
    }

    totalLen = totalLen - to + from - 1;
    **currentLineNum = from;

    while (from <= to){
        del = poi->next;
        poi->next = del->next;
        delete del;
        ++from;
    }

    if (**currentLineNum > totalLen)  **currentLineNum = totalLen;
}

void Buffer::insertLine(const string &text){
    node *poi = head;
    int tmp = **currentLineNum;

    while (--tmp > 0){
        poi = poi->next;
    }

    poi->next = new node (text, poi->next);
    if (**currentLineNum == 0)  **currentLineNum = 1;
    ++totalLen;
}

void Buffer::appendLine(const string &text){
    node *poi = head;
    int tmp = **currentLineNum;

    while (tmp--){
        poi = poi->next;
    }

    poi->next = new node (text, poi->next);
    ++(**currentLineNum);
    ++totalLen;
}

//throw >> Line number out of range
const string &Buffer::moveToLine(int idx) const {
    node *poi = head->next;
    if (idx <= 0 || idx > totalLen){
        throw "Line number out of range";
    }

    **currentLineNum = idx;
    while (--idx){
        poi = poi->next;
    }

    return poi->contents;
}
