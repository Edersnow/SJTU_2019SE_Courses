#include "evalContext.h"
#include "exceptions.h"

void EvaluationContext::setIntValue(QString var, int value){
    strSymbolTable.remove(var);
    intSymbolTable.insert(var, value);
}

void EvaluationContext::setStrValue(QString var, QString value){
    intSymbolTable.remove(var);
    strSymbolTable.insert(var, value);
}

int EvaluationContext::getIntValue(QString var){
    if (strSymbolTable.contains(var)) {
        throw miniBasic::runtimeError("Incorrect variable type: " + var);
    }
    if (!intSymbolTable.contains(var)){
        throw miniBasic::runtimeError("Undeclared variable: " + var);
    }
    return intSymbolTable[var];
}

QString EvaluationContext::getStrValue(QString var){
    if (intSymbolTable.contains(var)) {
        throw miniBasic::runtimeError("Incorrect variable type: " + var);
    }
    if (!strSymbolTable.contains(var)){
        throw miniBasic::runtimeError("Undeclared variable: " + var);
    }
    return strSymbolTable[var];
}

bool EvaluationContext::existIntVariable(QString var){
    return intSymbolTable.contains(var);
}

bool EvaluationContext::existStrVariable(QString var){
    return strSymbolTable.contains(var);
}

QString EvaluationContext::getAllVariables(){
    QString res;

    QMap<QString, int>::iterator it;
    QMap<QString, int>::iterator endIt = intSymbolTable.end();
    for (it = intSymbolTable.begin(); it != endIt; ++it) {
        res += it.key() + ": INT = " + QString::number(it.value()) + "\n";
    }

    QMap<QString, QString>::iterator ite;
    QMap<QString, QString>::iterator endIte = strSymbolTable.end();
    for (ite = strSymbolTable.begin(); ite != endIte; ++ite) {
        res += ite.key() + ": STR = \"" + ite.value() + "\"\n";
    }

    return res;
}


void EvaluationContext::clear(){
    intSymbolTable.clear();
    strSymbolTable.clear();
}
