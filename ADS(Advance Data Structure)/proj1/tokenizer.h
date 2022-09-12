#ifndef TOKENIZER_H
#define TOKENIZER_H


#include <QString>
#include <QMap>
#include "statement.h"

//an string -> statementSet processor
class tokenizer
{   
private:
    //Error occur
    class wrongStatement{};

public:
    tokenizer() = default;

    //get Statement pointer from a string
    Statement *getStmts(QString);
};

#endif // TOKENIZER_H
