#include "program.h"
#include "tokenizer.h"
#include <QFileDialog>
#include <QTextStream>

void program::handleInputs(){
    //handle the cmds/stmts input
    if (inputQueue->empty() || receiveType != 0)  return;
    QString raw = inputQueue->dequeue();
    raw = raw.trimmed();
    int ind = 0;
    int tmp = ind;
    while (tmp < raw.length() && raw[tmp] >= '0' && raw[tmp] <= '9')  ++tmp;
    if (tmp == ind){
        handleCmds(raw);
    }
    else{
        handleStmts(raw, ind, tmp);
    }
}

void program::handleCmds(QString raw){
    raw = raw.trimmed();
    exeCmds(raw);
}

void program::handleStmts(QString raw, int ind, int tmp){
    int lineNum = raw.mid(ind, tmp - ind).toInt();
    if (lineNum <= 0 || lineNum > 1000000){
        emit showMsg(miniBasic::exceptions("Invalid line Number: " + QString::number(lineNum)));
        handleInputs();
        return;
    }

    if (tmp == raw.length()){
        rawStmts->remove(lineNum);
    }
    else {
        if (raw[tmp] != ' '){
            emit CEoccur(miniBasic::compileError("Lake blank space after line number."));
            handleInputs();
            return;
        }
        rawStmts->insert(lineNum, QPair<QString, int>(raw.mid(tmp, -1), 0));
    }

    // display codes
    QString codes;
    QMap<int, QPair<QString, int>>::iterator ite;
    for (ite = rawStmts->begin(); ite != rawStmts->end(); ++ite){
        codes += QString::number(ite.key(), 10) + ite.value().first + '\n';
    }
    emit showCodes(codes);

    handleInputs();
}

void program::exeNextStmts(){
    try{

    while (rawIt != rawStmts->end()){
        QPair<bool, int> tmp;
        tokenizer tok;
        Statement *p = tok.getStmts(rawIt.value().first);
        StatementType typ = p->type();
        switch (typ) {
        case REM:
            ++rawIt;
            break;

        case LET:
            p->execLet(variableSet);
            ++rawIt;
            break;

        case STRLET:
            p->execStrLet(variableSet);
            ++rawIt;
            break;

        case PRINT:
            emit appendResult(p->execPrint(variableSet));
            ++rawIt;
            break;

        case PRINTF:
            emit appendResult(p->execPrintf(variableSet));
            ++rawIt;
            break;

        case INPUT:
            emit showVariables(variableSet.getAllVariables());
            emit requestInput();
            return;

        case INPUTS:
            emit showVariables(variableSet.getAllVariables());
            emit requestInput();
            return;

        case GOTO:
            rawIt = rawStmts->find(p->execGoto());
            if (rawIt == rawStmts->end()){
                throw miniBasic::runtimeError("Inexistend line number");
            }
            break;

        case IF:
            tmp = p->execIf(variableSet);
            if (tmp.first){
                rawIt = rawStmts->find(tmp.second);
                if (rawIt == rawStmts->end()){
                    throw miniBasic::runtimeError("Inexistent line number");
                }
            }
            else{
                ++rawIt;
            }
            break;

        case END:
            rawIt = rawStmts->end();
            break;

        default:
            throw miniBasic::fatalError("wrong statements");
        }
    }



    } catch (miniBasic::runtimeError &msg){
        isDebuging = false;
        isDebugingRuning = false;
        emit enableLoadClearInput();
        emit showVariables(variableSet.getAllVariables());
        emit REoccur(msg);
        emit showMsg(miniBasic::exceptions("Program Abort."));
        return;

    } catch (miniBasic::compileError &msg){
        isDebuging = false;
        isDebugingRuning = false;
        emit enableLoadClearInput();
        emit showVariables(variableSet.getAllVariables());
        emit CEoccur(msg);
        emit showMsg(miniBasic::exceptions("Program Abort."));
        return;

    } catch (...){
        throw miniBasic::fatalError("Unknown Error");
    }


    isDebuging = false;
    isDebugingRuning = false;
    emit enableLoadClearInput();
    emit showVariables(variableSet.getAllVariables());
    emit showMsg(miniBasic::exceptions("Process exit normally."));
}

void program::exeNextStmt(){
    try{


    QPair<bool, int> tmp;
    tokenizer tok;
    Statement *p = tok.getStmts(rawIt.value().first);
    StatementType typ = p->type();
    switch (typ) {
    case REM:
        ++rawIt;
        break;

    case LET:
        p->execLet(variableSet);
        ++rawIt;
        break;

    case STRLET:
        p->execStrLet(variableSet);
        ++rawIt;
        break;

    case PRINT:
        emit appendResult(p->execPrint(variableSet));
        ++rawIt;
        break;

    case PRINTF:
        emit appendResult(p->execPrintf(variableSet));
        ++rawIt;
        break;

    case INPUT:
        emit showVariables(variableSet.getAllVariables());
        emit requestInput();
        break;

    case INPUTS:
        emit showVariables(variableSet.getAllVariables());
        emit requestInput();
        break;

    case GOTO:
        rawIt = rawStmts->find(p->execGoto());
        if (rawIt == rawStmts->end()){
            throw miniBasic::runtimeError("Inexistend line number");
        }
        break;

    case IF:
        tmp = p->execIf(variableSet);
        if (tmp.first){
            rawIt = rawStmts->find(tmp.second);
            if (rawIt == rawStmts->end()){
                throw miniBasic::runtimeError("Inexistent line number");
            }
        }
        else{
            ++rawIt;
        }
        break;

    case END:
        rawIt = rawStmts->end();
        break;

    default:
        throw miniBasic::fatalError("wrong statements");
    }


    } catch (miniBasic::runtimeError &msg){
        isDebuging = false;
        emit popHighlight();
        emit enableLoadClearInput();
        emit REoccur(msg);
        emit showMsg(miniBasic::exceptions("Program Abort."));
        emit showVariables(variableSet.getAllVariables());
        return;

    } catch (miniBasic::compileError &msg){
        isDebuging = false;
        emit popHighlight();
        emit enableLoadClearInput();
        emit CEoccur(msg);
        emit showMsg(miniBasic::exceptions("Program Abort."));
        emit showVariables(variableSet.getAllVariables());
        return;

    } catch (...){
        throw miniBasic::fatalError("Unknown Error");
    }


    if (rawIt == rawStmts->end()){
        isDebuging = false;
        emit enableLoadClearInput();
        emit showMsg(miniBasic::exceptions("Process exit normally."));
        emit showVariables(variableSet.getAllVariables());
        emit popHighlight();
        return;
    }
    QColor tmpColor(100, 255, 100);

    emit popHighlight();
    emit showStepHighlight(rawIt.value().second, &tmpColor);
    emit showVariables(variableSet.getAllVariables());
}

void program::exeStmts(){
    try{


    QPair<bool, int> tmp;
    while (it != statementSet->end()) {
        StatementType typ = it.value()->type();
        switch (typ) {
        case REM:
            ++it;
            break;

        case LET:
            it.value()->execLet(variableSet);
            ++it;
            break;

        case STRLET:
            it.value()->execStrLet(variableSet);
            ++it;
            break;

        case PRINT:
            emit appendResult(it.value()->execPrint(variableSet));
            ++it;
            break;

        case PRINTF:
            emit appendResult(it.value()->execPrintf(variableSet));
            ++it;
            break;

        case INPUT:
            receiveType = 1;
            emit requestInput();
            emit showVariables(variableSet.getAllVariables());
            return;

        case INPUTS:
            receiveType = 1;
            emit requestInput();
            emit showVariables(variableSet.getAllVariables());
            return;

        case GOTO:
            it = statementSet->find(it.value()->execGoto());
            if (it == statementSet->end()){
                throw miniBasic::runtimeError("Inexistend line number");
            }
            break;

        case IF:
            tmp = it.value()->execIf(variableSet);
            if (tmp.first){
                it = statementSet->find(tmp.second);
                if (it == statementSet->end()){
                    throw miniBasic::runtimeError("Inexistent line number");
                }
            }
            else{
                ++it;
            }
            break;

        case END:
            it = statementSet->end();
            break;

        default:
            throw miniBasic::fatalError("wrong statements");
        }
    }


    } catch (miniBasic::runtimeError &msg){
        emit REoccur(msg);
        emit showVariables(variableSet.getAllVariables());

        for (auto ite: *statementSet){
            delete ite;
        }
        statementSet->clear();
        it = statementSet->begin();
    }

    emit showVariables(variableSet.getAllVariables());

    //possible route : getInput() -> exeStmts()
    handleInputs();

    return;
}

void program::exeCmds(QString raw){
    try{

    QString ite = raw;

    ite = ite.trimmed();
    if (ite == "RUN"){
        runCode();
    }
    else if (ite == "LOAD"){
        loadCode();
    }
    else if (ite == "LIST"){
        //DO NOTHING
    }
    else if (ite == "CLEAR"){
        clear();
    }
    else if (ite == "HELP"){
        static QString help(
"The programming language BASIC—the name is an acronym for Beginner’s All-purpose\
Symbolic Instruction Code—was developed in the mid-1960s at Dartmouth College by John\
Kemeny and Thomas Kurtz. It was one of the first languages designed to be easy to use and\
learn. Although BASIC has now pretty much disappeared as a teaching language, its ideas\
live on in Microsoft’s Visual Basic system, which remains in widespread use.\n\
Go to WIKI to see more:)");
        emit appendResult(help);
    }
    else if (ite == "QUIT"){
        inputQueue->clear();
        emit quit();
        return;
    }
    else if (ite.mid(0, 4) == "LET "){
        tokenizer tok;
        Statement *p = tok.getStmts(ite);
        if (p->type() == LET){
            p->execLet(variableSet);
        }
        else {
            p->execStrLet(variableSet);
        }
        delete p;
    }
    else if (ite.mid(0, 6) == "INPUT "){
        //try compile
        tokenizer tok;
        Statement *p = tok.getStmts(ite);
        delete p;

        receiveType = 2;
        inputQueue->push_front(ite);
        emit requestInput();
        return;
    }
    else if (ite.mid(0, 6) == "INPUTS "){
        //try compile
        tokenizer tok;
        Statement *p = tok.getStmts(ite);
        delete p;

        receiveType = 2;
        inputQueue->push_front(ite);
        emit requestInput();
        return;
    }
    else if (ite.mid(0, 6) == "PRINT "){
        tokenizer tok;
        Statement *p = tok.getStmts(ite);
        emit appendResult(p->execPrint(variableSet));
        delete p;
    }
    else if (ite.mid(0, 7) == "PRINTF "){
        tokenizer tok;
        Statement *p = tok.getStmts(ite);
        emit appendResult(p->execPrintf(variableSet));
        delete p;
    }
    else {
        throw  miniBasic::runtimeError("Wrong command: " + ite);
    }


    } catch (miniBasic::runtimeError &msg){
        emit REoccur(msg);
    } catch (miniBasic::compileError &msg){
        emit CEoccur(msg);
    } catch (...){
        throw miniBasic::fatalError("Unknown Error");
    }

    emit showVariables(variableSet.getAllVariables());

    //check input list
    if (!receiveType){
        handleInputs();
    }

    return;
}

bool program::buildStmts(){
    bool isCompileSuccess = true;
    statementSet->clear();

    tokenizer tok;
    QMap<int, QPair<QString, int>>::iterator ite = rawStmts->begin();

    QString synTree = "";
    QVector<QPair<int, QColor>> CERec;
    int posRec = 0;

    while (ite != rawStmts->end()){
    try{
        Statement *tmpPointer = tok.getStmts(ite.value().first);
        (*statementSet)[ite.key()] = tmpPointer;
        synTree += QString::number(ite.key()) + " " + tmpPointer->getSyntaxTree() + '\n';

        ite.value().second = posRec;
        posRec += QString::number(ite.key()).length() + ite.value().first.length() + 1;

        ++ite;

    } catch (miniBasic::compileError &msg){
        //handle compile error
        isCompileSuccess = false;
        synTree += QString::number(ite.key()) + " Error\n";
        CERec.append(QPair<int, QColor> (posRec, QColor(255, 100, 100)));

        msg.setLine(ite.key());
        emit CEoccur(msg);

        ite.value().second = posRec;
        posRec += QString::number(ite.key()).length() + ite.value().first.length() + 1;
        ++ite;
    }
    }
    emit showSyntaxTree(synTree);
    emit showCEHighlight(&CERec);

    return isCompileSuccess;
}

program::program(QObject *p){
    this->setParent(p);
    statementSet = new QMap <int, Statement *>;
    inputQueue = new QQueue <QString>;
    rawStmts = new QMap <int, QPair<QString, int>>;
    receiveType = 0;
    isDebuging = false;
    isDebugingRuning = false;

    clear();
}

program::~program(){
    for (auto ite: *statementSet){
        delete ite;
    }
    delete statementSet;
    delete inputQueue;
    delete rawStmts;
}

void program::loadCode(){
    if (receiveType != 0)  return;

    QString fileDir = QFileDialog::getOpenFileName(nullptr, tr("Open File"), "");
    if (fileDir == "")  return;

    QFile file(fileDir);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
        return;

    QTextStream in(&file);
    while (!in.atEnd()) {
        QString raw = in.readLine();
        raw = raw.trimmed();
        if (raw != ""){
            inputQueue->enqueue(raw);
        }
    }

    file.close();

    handleInputs();

    return;
}

void program::runCode(){
    if (receiveType != 0)  return;

    if (isDebuging){
        isDebugingRuning = true;
        emit popHighlight();
        exeNextStmts();
        return;
    }

    for (auto iter: *statementSet){
        delete iter;
    }
    statementSet->clear();
    it = statementSet->end();

    bool isCompileSuccess = buildStmts();

    if (!isCompileSuccess){
        if (isDebuging){
            isDebuging = false;
            emit enableLoadClearInput();
        }
        for (auto ite: *statementSet){
            delete ite;
        }
        statementSet->clear();
        it = statementSet->end();
        return;
    }

    it = statementSet->begin();
    exeStmts();

    return;
}

void program::debugCode(){
    if (receiveType != 0 || rawStmts->isEmpty())  return;

    if (isDebuging){
        exeNextStmt();
        return;
    }

    isDebuging = true;
    emit disableLoadClearInput();
    statementSet->clear();
    buildStmts();

    QColor tmpColor(100, 255, 100);
    emit showStepHighlight(0, &tmpColor);
    rawIt = rawStmts->begin();
}

void program::clear(){
    if (receiveType != 0)  return;

    for (auto ite: *statementSet){
        delete ite;
    }
    statementSet->clear();
    rawStmts->clear();
    variableSet.clear();
    it = statementSet->end();

    emit clearWidget();

    return;
}

void program::getInput(QString raw){
    if (isDebuging){
        QStringList strList = raw.split("\n", Qt::SkipEmptyParts);
        raw = strList[0];

        int ind = 0;
        while (ind < raw.length() && raw[ind] == ' ')  ++ind;
        if (ind < raw.length() && raw[ind] == '?')  ++ind;
        while (ind < raw.length() && raw[ind] == ' ')  ++ind;

        tokenizer tok;
        Statement *p = tok.getStmts(rawIt.value().first);
        if (p->type() == INPUT){
            raw = raw.mid(ind);

            bool flag;
            int num = raw.toInt(&flag);
            if (!flag){
                if (!isDebugingRuning){
                    emit popHighlight();
                }
                isDebuging = false;
                isDebugingRuning = false;
                emit showVariables(variableSet.getAllVariables());
                emit enableAllButton();
                emit REoccur(miniBasic::runtimeError("Invalid input: " + raw));
                emit showMsg(miniBasic::exceptions("Program Abort."));
                return;
            }

            p->execInput(num, variableSet);
        }
        else if (p->type() == INPUTS){
            p->execInputs(raw.mid(ind), variableSet);
        }
        else {
            throw miniBasic::fatalError("");
        }

        delete p;

        ++rawIt;
        QColor tmpColor(100, 255, 100);

        emit showVariables(variableSet.getAllVariables());
        emit enableAllButton();
        emit disableLoadClearInput();

        if (isDebugingRuning){
            exeNextStmts();
        }
        else {
            emit popHighlight();
            emit showStepHighlight(rawIt.value().second, &tmpColor);
        }
    }

    else if (receiveType == 0){
        QStringList strList = raw.split("\n", Qt::SkipEmptyParts);

        for (auto ite: strList){
            ite = ite.trimmed();
            if (ite != ""){
                inputQueue->enqueue(ite);
            }
        }

        emit showVariables(variableSet.getAllVariables());
        handleInputs();
    }
    //cmds
    else if (receiveType == 2){
        try{

        QStringList strList = raw.split("\n", Qt::SkipEmptyParts);
        raw = strList[0];

        int ind = 0;
        while (ind < raw.length() && raw[ind] == ' ')  ++ind;
        if (ind < raw.length() && raw[ind] == '?')  ++ind;
        while (ind < raw.length() && raw[ind] == ' ')  ++ind;

        tokenizer tok;
        Statement *p = tok.getStmts(inputQueue->front());
        if (p->type() == INPUT){
            raw = raw.mid(ind);

            bool flag;
            int num = raw.toInt(&flag);
            if (!flag){
                throw miniBasic::runtimeError("Invalid input: " + raw);
            }

            p->execInput(num, variableSet);
        }
        else if (p->type() == INPUTS){
            p->execInputs(raw.mid(ind), variableSet);
        }
        else {
            throw miniBasic::fatalError("");
        }

        inputQueue->dequeue();
        delete p;


        } catch (miniBasic::runtimeError &msg){
            inputQueue->dequeue();
            emit showVariables(variableSet.getAllVariables());
            emit REoccur(msg);

        } catch (miniBasic::compileError &msg){
            inputQueue->dequeue();
            emit showVariables(variableSet.getAllVariables());
            emit CEoccur(msg);

        } catch (...){
            throw miniBasic::fatalError("Unknown error");
        }

        receiveType = 0;
        emit showVariables(variableSet.getAllVariables());
        emit enableAllButton();

        handleInputs();
    }
    //stmts
    else if (receiveType == 1) {
        try{

        QStringList strList = raw.split("\n", Qt::SkipEmptyParts);
        raw = strList[0];

        int ind = 0;
        while (ind < raw.length() && raw[ind] == ' ')  ++ind;
        if (ind < raw.length() && raw[ind] == '?')  ++ind;
        while (ind < raw.length() && raw[ind] == ' ')  ++ind;

        if (it.value()->type() == INPUT){
            raw = raw.mid(ind);

            bool flag;
            int num = raw.toInt(&flag);
            if (!flag){
                //handle error program
                receiveType = 0;

                for (auto ite: *statementSet){
                    delete ite;
                }
                statementSet->clear();
                it = statementSet->end();
                emit showVariables(variableSet.getAllVariables());

                emit REoccur(miniBasic::runtimeError("Invalid input: " + raw));
                emit enableAllButton();
                return;
            }

            it.value()->execInput(num, variableSet);
        }
        else if (it.value()->type() == INPUTS){
            it.value()->execInputs(raw.mid(ind), variableSet);
        }
        else {
            throw miniBasic::fatalError("");
        }


        } catch (...){
            throw miniBasic::fatalError("Unknown error");
        }

        ++ it;
        receiveType = 0;
        emit showVariables(variableSet.getAllVariables());
        emit enableAllButton();
        exeStmts();
    }
    return;
}


