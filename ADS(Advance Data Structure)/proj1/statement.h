#ifndef STATEMENT_H
#define STATEMENT_H

#include <QString>
#include "evalContext.h"
#include "exp.h"


enum StatementType {NULLSTMT, REM, LET, STRLET, PRINT, PRINTF, INPUT, INPUTS, GOTO, IF, END};


class Statement{
public:
    Statement();
    virtual ~Statement();

    //get statementType
    virtual StatementType type() = 0;

    //get the syntaxTree of the stmt
    virtual QString getSyntaxTree() = 0;


    //execute each stmt
    virtual void execLet(EvaluationContext &);
    virtual void execStrLet(EvaluationContext &);
    virtual QString execPrint(EvaluationContext &);
    virtual QString execPrintf(EvaluationContext &);
    virtual void execInput(int, EvaluationContext &);
    virtual void execInputs(QString, EvaluationContext &);
    virtual int execGoto();
    virtual QPair<bool, int> execIf(EvaluationContext &);
};


class RemStmt: public Statement{
protected:
    QString Remark;

public:
    RemStmt(QString);
    virtual ~RemStmt();

    virtual StatementType type();
    virtual QString getSyntaxTree();
};


class LetStmt: public Statement{
protected:
    //store variable & expression
    QString var;
    Expression *exp;

public:
    LetStmt(QString, Expression *);
    virtual ~LetStmt();

    virtual StatementType type();
    virtual QString getSyntaxTree();

    //bind variable
    virtual void execLet(EvaluationContext &);
};


class StrLetStmt: public Statement{
protected:
    QString var;
    QString value;

public:
    StrLetStmt(QString, QString);
    virtual ~StrLetStmt();

    virtual StatementType type();
    virtual QString getSyntaxTree();

    virtual void execStrLet(EvaluationContext &);
};


class PrintStmt: public Statement{
protected:
    //store expression
    Expression *exp;

public:
    PrintStmt(Expression *);
    virtual ~PrintStmt();

    virtual StatementType type();
    virtual QString getSyntaxTree();

    //return the value
    virtual QString execPrint(EvaluationContext &);
};


class PrintfStmt: public Statement{
protected:
    QString format;
    QVector<QString> *para;

public:
    PrintfStmt(QString, QVector<QString> *);
    virtual ~PrintfStmt();

    virtual StatementType type();
    virtual QString getSyntaxTree();

    virtual QString execPrintf(EvaluationContext &);
};


class InputStmt: public Statement{
protected:
    //store variable
    QString var;

public:
    InputStmt(QString);
    virtual ~InputStmt();

    virtual StatementType type();
    virtual QString getSyntaxTree();

    //set variable
    virtual void execInput(int, EvaluationContext &);
};


class InputsStmt: public Statement{
protected:
    QString var;

public:
    InputsStmt(QString);
    virtual ~InputsStmt();

    virtual StatementType type();
    virtual QString getSyntaxTree();

    //set variable
    virtual void execInputs(QString, EvaluationContext &);
};


class GotoStmt: public Statement{
protected:
    int GotoNum;

public:
    GotoStmt(int);
    virtual ~GotoStmt();

    virtual StatementType type();
    virtual QString getSyntaxTree();

    //return line Num
    virtual int execGoto();
};


class IfStmt: public Statement{
protected:
    Expression *exp1;
    QString op;
    Expression *exp2;
    int GotoNum;

public:
    IfStmt(Expression *, QString, Expression *, int);
    virtual ~IfStmt();

    virtual StatementType type();
    virtual QString getSyntaxTree();

    //return take branch or not & line Num
    virtual QPair<bool, int> execIf(EvaluationContext &);
};


class EndStmt: public Statement{
public:
    EndStmt();
    virtual ~EndStmt();

    virtual StatementType type();
    virtual QString getSyntaxTree();
};


#endif // STATEMENT_H
