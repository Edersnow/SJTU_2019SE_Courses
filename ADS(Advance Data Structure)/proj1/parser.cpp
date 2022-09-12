#include <QStack>
#include <QSet>
#include "parser.h"
#include "exceptions.h"

parser::parser(){

}

bool parser::isInOpSet(char tmp){
    static QSet<char> opSet = {'+', '-', '*', '/', '(', ')'};
    return opSet.contains(tmp);
}

bool parser::isInNumSet(char tmp){
    return tmp >= '0' && tmp <= '9';
}

bool parser::isInVarSet(char tmp){
    return isInNumSet(tmp) || isInVarHeadSet(tmp);
}

bool parser::isInSkipSet(char tmp){
    return QChar::isSpace(tmp);
}

bool parser::isInVarHeadSet(char tmp){
    if(QChar::isUpper(tmp))  tmp = QChar::toLower(tmp);
    return (tmp >= 'a' && tmp <= 'z') || tmp == '_';
}

bool parser::isReservedWord(QString &other){
    static QSet<QString> ReservedWordSet = {
        "REM",
        "LET",
        "PRINT",
        "INPUT",
        "GOTO",
        "IF",
        "END",
        "RUN",
        "LOAD",
        "LIST",
        "CLEAR",
        "HELP"
    };
    return ReservedWordSet.contains(other);
}

QString parser::getNextExp(ExpressionType &type){
    QString res = "";
    while (ind < raw.length() && isInSkipSet(raw[ind].unicode()))  ++ind;

    if (ind == raw.length()){
        type = NULLEXP;
    }
    else if (isInNumSet(raw[ind].unicode())){
        type = CONSTANT;

        int tmp = ind + 1;
        while (tmp < raw.length() && isInNumSet(raw[tmp].unicode()))  ++tmp;
        res = raw.mid(ind, tmp - ind);
        ind = tmp;
    }
    else if (isInVarHeadSet(raw[ind].unicode())){
        type = IDENTIFIER;

        int tmp = ind + 1;
        while (tmp < raw.length() && isInVarSet(raw[tmp].unicode()))  ++tmp;
        res = raw.mid(ind, tmp - ind);
        ind = tmp;
    }
    else if (isInOpSet(raw[ind].unicode())){
        type = COMPOUND;

        if (raw[ind] == '*' && ind+1 < raw.length() && raw[ind+1] == '*'){
            ++ind;
            res = "**";
        }
        else if (raw[ind].unicode() == '-'){
            int tmp = ind - 1;
            while (tmp >= 0 && raw[tmp].unicode() == ' ')  --tmp;

            if (tmp < 0 || raw[tmp].unicode() == '('){
                res = "--";
            }
            else{
                res = "-";
            }
        }
        else{
            res = raw[ind];
        }

        ++ind;


    }
    else{
        throw wrongExpression();
    }

    return res;
}

Expression *parser::getTree(QString other){
    raw = other;
    ind = 0;

    Expression *res = nullptr;
    QStack<Expression *> expStack;
    QStack<QString> opStack;
    ExpressionType typ;
    QString exp;

    try{


    while (true){
        exp = getNextExp(typ);
        if (typ == NULLEXP)  break;

        Expression *tmp;

        switch (typ) {
        case CONSTANT:
            tmp = new ConstantExp (exp.toInt());
            while (opStack.length() && opStack.top() == "--"){
                opStack.pop();
                tmp = new CompoundExp ("--", nullptr, tmp);
            }
            expStack.push(tmp);
            break;

        case IDENTIFIER:
            if (isReservedWord(exp)){
                throw wrongExpression();
            }
            tmp = new IdentifierExp (exp);
            while (opStack.length() && opStack.top() == "--"){
                opStack.pop();
                tmp = new CompoundExp ("--", nullptr, tmp);
            }
            expStack.push(tmp);
            break;

        case COMPOUND:
            if (exp == "+" || exp == "-"){
                QString opTop;
                while (true) {
                    if (!opStack.length())  break;
                    opTop = opStack.top();
                    if (opTop == "(")  break;
                    buildTree(expStack, opStack);
                }
                opStack.push(exp);
            }
            else if (exp == "*" || exp == "/"){
                QString opTop;
                while (true){
                    if (!opStack.length())  break;
                    opTop = opStack.top();
                    if (opTop == "(" || opTop == "+" || opTop == "-")  break;
                    buildTree(expStack, opStack);
                }
                opStack.push(exp);
            }
            else if (exp == "**" || exp == "--" || exp == "("){
                opStack.push(exp);
            }
            else if (exp == ")"){
                QString opTop;
                while (true) {
                    if (!opStack.length())  break;
                    opTop = opStack.top();
                    if (opTop == "(")  break;
                    buildTree(expStack, opStack);
                }
                if (!opStack.length())  throw wrongExpression();
                if (opStack.top() == "(")  opStack.pop();

                if (!expStack.length())  throw wrongExpression();
                tmp = expStack.pop();
                while (opStack.length() && opStack.top() == "--"){
                    opStack.pop();
                    tmp = new CompoundExp ("--", nullptr, tmp);
                }
                expStack.push(tmp);
            }
            else{
                throw wrongExpression();
            }
            break;

        default:
            throw miniBasic::fatalError("Unexcepted ExpressionType");
        }
    }

    while (opStack.length())  buildTree(expStack, opStack);
    if (!expStack.length())  throw wrongExpression();
    res = expStack.pop();
    if (expStack.length())  throw wrongExpression();

    return res;

    } catch (wrongExpression){
        for (auto ite: expStack){
            delete ite;
        }
        throw miniBasic::compileError("Incorrect expression \"" + raw + "\".");
    }
}

void parser::buildTree(QStack<Expression *> &expStack, QStack<QString> &opStack){
    Expression *exp1, *exp2;
    QString op;

    op = opStack.pop();
    if (op == "--")  throw wrongExpression();

    if (expStack.length() < 2)  throw wrongExpression();
    exp2 = expStack.pop();
    exp1 = expStack.pop();

    expStack.push(new CompoundExp (op, exp1, exp2));
}


