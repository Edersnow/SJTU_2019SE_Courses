#ifndef PROGRAM_H
#define PROGRAM_H

#include <QObject>
#include <QString>
#include <QQueue>
#include <QMap>
#include "exceptions.h"
#include "statement.h"
#include "evalContext.h"




class program: public QObject
{
    Q_OBJECT

private:
    //tore statement
    QMap<int, Statement *> *statementSet;

    //store variables
    EvaluationContext variableSet;

    //store current line to be execute
    QMap<int, Statement *>::iterator it;


    //the input queue
    QQueue<QString> *inputQueue;

    //raw codes displayed in the code widget
    QMap<int, QPair<QString, int>> *rawStmts;

    QMap<int, QPair<QString, int>>::iterator rawIt;

    //need debug info;
    bool needDebugInfo;

    //isDebugingRuning
    bool isDebugingRuning;

private:
    //handle input queues
    void handleInputs();
    void handleCmds(QString);
    void handleStmts(QString, int, int);

    //execute stmts from it
    void exeNextStmt();
    void exeNextStmts();
    void exeStmts();

    //execute commandQueue
    void exeCmds(QString);

    //try compile
    bool buildStmts();

public:
    //is debuging
    bool isDebuging;

    //receive normal stmts/cmds or receive
    int receiveType; //0->normal, 1->stmts, 2->cmds


    explicit program(QObject *parent = nullptr);
    ~program();

signals:
    //append results on the widget
    void appendResult(QString);

    //display the syntax tree
    void showSyntaxTree(QString);

    //show codes
    void showCodes(QString);

    //highlight
    void showCEHighlight(QVector<QPair<int, QColor>> *);
    void showStepHighlight(int, QColor *);

    //pop highlight
    void popHighlight();

    //show variables
    void showVariables(QString);

    //clear all the widget
    void clearWidget();

    //request an input
    void requestInput();

    //convey the compileError msg
    void CEoccur(miniBasic::compileError);

    //convey the runtimeError msg
    void REoccur(miniBasic::runtimeError);

    //convey other msg
    void showMsg(miniBasic::exceptions);

    //send quit msg
    void quit();

    //enable the buttons
    void enableAllButton();

    //disable load and clear buttons
    void disableLoadClearInput();

    //enable load and clear buttons
    void enableLoadClearInput();

public slots:
    //responding to three buttons
    void loadCode();
    void runCode();
    void debugCode();
    void clear();

    //receive input
    void getInput(QString);

};

#endif // PROGRAM_H
