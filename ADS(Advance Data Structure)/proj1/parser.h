#ifndef PARSER_H
#define PARSER_H


#include <QStack>
#include <QString>
#include "exp.h"



//an string -> expressionTree processor
class parser
{
private:
    class wrongExpression{};

    QString raw;
    int ind;

    // some judgement function

    // valid operator
    bool isInOpSet(char);

    // valid number
    bool isInNumSet(char);

    // valid variable(the first variable character excluded)
    bool isInVarSet(char);

    // the char show be ignored
    bool isInSkipSet(char);

    // valid first variable character
    bool isInVarHeadSet(char);

    // reserved words (like c++)
    bool isReservedWord(QString &);

    // get next expression
    QString getNextExp(ExpressionType &);

    // merge two expressions by op
    void buildTree(QStack<Expression *> &, QStack<QString> &);

public:
    parser();

    // String => Expression tree
    Expression *getTree(QString);
};

#endif // PARSER_H
