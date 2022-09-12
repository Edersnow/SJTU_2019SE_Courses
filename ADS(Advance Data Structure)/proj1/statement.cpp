#include "statement.h"
#include "exceptions.h"

Statement::Statement()
{

}

Statement::~Statement(){

}

void Statement::execLet(EvaluationContext &){

}

void Statement::execStrLet(EvaluationContext &){

}

QString Statement::execPrint(EvaluationContext &){
    return "";
}

QString Statement::execPrintf(EvaluationContext &){
    return "";
}

void Statement::execInput(int, EvaluationContext &){

}

void Statement::execInputs(QString, EvaluationContext &){

}

int Statement::execGoto(){
    return 0;
}

QPair<bool, int> Statement::execIf(EvaluationContext &){
    return QPair<bool, int>(false, 0);
}



RemStmt::RemStmt(QString r)
    :Remark(qMove(r)){}

RemStmt::~RemStmt(){

}

StatementType RemStmt::type(){
    return REM;
}

QString RemStmt::getSyntaxTree(){
    return "REM\n  " + Remark;
}



LetStmt::LetStmt(QString v, Expression *e)
    :var(qMove(v)), exp(e){}

LetStmt::~LetStmt(){
    delete exp;
}

StatementType LetStmt::type(){
    return LET;
}

QString LetStmt::getSyntaxTree(){
    return "LET =\n  " + var + "\n" + exp->toString(2);
}

void LetStmt::execLet(EvaluationContext &dic){
    dic.setIntValue(var, exp->eval(dic));
}



StrLetStmt::StrLetStmt(QString v, QString e)
    :var(qMove(v)), value(qMove(e)) {}

StrLetStmt::~StrLetStmt(){

}

StatementType StrLetStmt::type(){
    return STRLET;
}

QString StrLetStmt::getSyntaxTree(){
    return "LET =\n  " + var + "\n  " + value;
}

void StrLetStmt::execStrLet(EvaluationContext &dic){
    dic.setStrValue(var, value);
}



PrintStmt::PrintStmt(Expression *e)
    :exp(e){}

PrintStmt::~PrintStmt(){
    delete exp;
}

StatementType PrintStmt::type(){
    return PRINT;
}

QString PrintStmt::getSyntaxTree(){
    return "PRINT\n" + exp->toString(2);
}

QString PrintStmt::execPrint(EvaluationContext &dic){
    return QString::number(exp->eval(dic), 10);
}



PrintfStmt::PrintfStmt(QString f, QVector<QString> *p)
    :format(qMove(f)), para(p){}

PrintfStmt::~PrintfStmt(){
    delete para;
}

StatementType PrintfStmt::type(){
    return PRINTF;
}

QString PrintfStmt::getSyntaxTree(){
    QString res = "PRINTF\n  " + format + "\n";
    for (auto &it: *para) {
        res += "  " + it.trimmed() + "\n";
    }
    return res;
}

QString PrintfStmt::execPrintf(EvaluationContext &dic){
    QString res;

    QStringList strList = format.split("{}");
    if (strList.length() != para->length() + 1) {
        throw miniBasic::runtimeError("Placeholder number unmatch.");
    }

    for (int i = 0; i < para->length(); ++i) {
        QString tmp = (*para)[i].trimmed();
        if (tmp == ""){
            throw miniBasic::runtimeError("Lack of param.");
        }

        bool flag = true;
        int testNum = tmp.toInt(&flag);

        res += strList[i];

        if (flag){
            res += QString::number(testNum);
        }
        else if ((tmp.front() == '\'' && tmp.back() == '\'') || (tmp.front() == '\"' && tmp.back() == '\"')){
            res += tmp.mid(1, tmp.length() - 2);
        }
        else if (dic.existIntVariable(tmp)){
            res += QString::number(dic.getIntValue(tmp));
        }
        else if (dic.existStrVariable(tmp)){
            res += dic.getStrValue(tmp);
        }
        else {
            throw miniBasic::runtimeError("Unexcept param: " + tmp);
        }
    }

    res += strList.back();

    return res;
}



InputStmt::InputStmt(QString v)
    :var(qMove(v)){}

InputStmt::~InputStmt(){

}

StatementType InputStmt::type(){
    return INPUT;
}

QString InputStmt::getSyntaxTree(){
    return "INPUT\n  " + var;
}

void InputStmt::execInput(int c, EvaluationContext &dic){
    dic.setIntValue(var, c);
}



InputsStmt::InputsStmt(QString v)
    :var(qMove(v)){}

InputsStmt::~InputsStmt(){

}

StatementType InputsStmt::type(){
    return INPUTS;
}

QString InputsStmt::getSyntaxTree(){
    return "INPUTS\n  " + var;
}

void InputsStmt::execInputs(QString c, EvaluationContext &dic){
    dic.setStrValue(var, c);
}



GotoStmt::GotoStmt(int c)
    :GotoNum(c){}

GotoStmt::~GotoStmt(){

}

StatementType GotoStmt::type(){
    return GOTO;
}

QString GotoStmt::getSyntaxTree(){
    return "GOTO\n  " + QString::number(GotoNum);
}

int GotoStmt::execGoto(){
    return GotoNum;
}



IfStmt::IfStmt(Expression *e1, QString o, Expression *e2, int c)
    :exp1(e1), op(qMove(o)), exp2(e2), GotoNum(c){}

IfStmt::~IfStmt(){
    delete exp1;
    delete exp2;
}

StatementType IfStmt::type(){
    return IF;
}

QString IfStmt::getSyntaxTree(){
    return "IF THEN\n" + exp1->toString(2) + "\n  " + op + "\n" + exp2->toString(2) + "\n  " + QString::number(GotoNum);
}

QPair<bool, int> IfStmt::execIf(EvaluationContext &dic){
    bool res = false;

    int lef = exp1->eval(dic);
    int rig = exp2->eval(dic);

    if (op == "<" && lef < rig)  res = true;
    else if (op == "=" && lef == rig)  res = true;
    else if (op == ">" && lef > rig)  res = true;

    return QPair<bool, int>(res, GotoNum);
}



EndStmt::EndStmt(){

}

EndStmt::~EndStmt(){

}

StatementType EndStmt::type(){
    return END;
}

QString EndStmt::getSyntaxTree(){
    return "END";
}





