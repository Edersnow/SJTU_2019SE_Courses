#include "tokenizer.h"
#include "parser.h"
#include "exceptions.h"

Statement *tokenizer::getStmts(QString it){
    Statement *res = nullptr;

    try{

    it = it.trimmed();

    int ind = 0;
    int tmp;

    if (it.mid(ind, 3) == "REM"){
        // ind + 5 won't be the end of this string
        ind += 3;
        QString Rem = it.mid(ind);
        res = new RemStmt(Rem);
    }

    else if (it.mid(ind, 4) == "LET "){
        ind += 4;
        tmp = it.indexOf("=");
        if (ind >= tmp)  throw wrongStatement();

        parser par;
        Expression *var = par.getTree(it.mid(ind, tmp - ind));
        if (var->type() != IDENTIFIER)  throw wrongStatement();

        ind = tmp + 1;
        while (ind < it.length() && QChar::isSpace(it[ind].unicode()))  ++ind;
        if (ind == it.length()){
            throw wrongStatement();
        }
        if (it[ind] == '\''){
            tmp = ind + 1;
            while (tmp < it.length() && it[tmp] != '\'')  ++tmp;
            if (tmp != it.length() - 1){
                throw wrongStatement();
            }
            QString rawStr = it.mid(ind + 1, tmp - ind - 1);
            res = new StrLetStmt(var->getIdentifierName(), rawStr);
        }
        else if (it[ind] == '\"'){
            tmp = ind + 1;
            while (tmp < it.length() && it[tmp] != '\"')  ++tmp;
            if (tmp != it.length() - 1){
                throw wrongStatement();
            }
            QString rawStr = it.mid(ind + 1, tmp - ind - 1);
            res = new StrLetStmt(var->getIdentifierName(), rawStr);
        }
        else {
            Expression *exp = par.getTree(it.mid(ind));
            res = new LetStmt(var->getIdentifierName(), exp);
        }
    }

    else if (it.mid(ind, 6) == "PRINT "){
        ind += 6;
        parser par;
        Expression *exp = par.getTree(it.mid(ind));
        res = new PrintStmt(exp);
    }

    else if (it.mid(ind, 7) == "PRINTF "){
        ind += 7;
        while (ind < it.length() && QChar::isSpace(it[ind].unicode()))  ++ind;
        if (ind == it.length()) {
            throw wrongStatement();
        }
        else if (it[ind] == '\'') {
            tmp = ind + 1;
            while (tmp < it.length() && it[tmp] != '\'')  ++tmp;
            if (tmp == it.length()){
                throw wrongStatement();
            }

            QString rawStr = it.mid(ind + 1, tmp - ind - 1);
            QVector<QString> *para = new QVector<QString> ();

            ind = tmp + 1;
            while (ind < it.length() && it[ind] != ',')  ++ind;

            if (ind == it.length()) {
                res = new PrintfStmt(rawStr, para);
            }
            else {
                ++ind;
                // return "" if ind >= len
                it = it.mid(ind);
                QStringList splitRes = it.split(',');
                for (auto &ite: splitRes){
                    para->append(ite);
                }
                res = new PrintfStmt(rawStr, para);
            }
        }
        else if (it[ind] == '\"'){
            // the same
            int tmp = ind + 1;
            while (tmp < it.length() && it[tmp] != '\"')  ++tmp;
            if (tmp == it.length()){
                throw wrongStatement();
            }

            QString rawStr = it.mid(ind + 1, tmp - ind - 1);
            QVector<QString> *para = new QVector<QString> ();

            ind = tmp + 1;
            while (ind < it.length() && it[ind] != ',')  ++ind;

            if (ind == it.length()) {
                res = new PrintfStmt(rawStr, para);
            }
            else {
                ++ind;
                // return "" if ind >= len
                it = it.mid(ind);
                QStringList splitRes = it.split(',');
                for (auto &ite: splitRes){
                    para->append(ite);
                }
                res = new PrintfStmt(rawStr, para);
            }
        }
        else{
            throw wrongStatement();
        }
    }

    else if (it.mid(ind, 6) == "INPUT "){
        ind += 6;
        parser par;
        Expression *var = par.getTree(it.mid(ind));
        if (var->type() != IDENTIFIER)  throw wrongStatement();

        res = new InputStmt(var->getIdentifierName());
    }

    else if (it.mid(ind, 7) == "INPUTS "){
        ind += 6;
        parser par;
        Expression *var = par.getTree(it.mid(ind));
        if (var->type() != IDENTIFIER)  throw wrongStatement();

        res = new InputsStmt(var->getIdentifierName());
    }

    else if (it.mid(ind, 5) == "GOTO "){
        ind += 5;
        parser par;
        Expression *con = par.getTree(it.mid(ind));
        if (con->type() != CONSTANT)  throw wrongStatement();

        res = new GotoStmt(con->getConstantValue());
    }

    else if (it.mid(ind, 3) == "IF "){
        ind += 3;
        Expression *exp1 = nullptr;
        Expression *exp2 = nullptr;
        Expression *con = nullptr;
        QString op = "";

        tmp = it.indexOf(" THEN ");
        int opInd;

        opInd = it.indexOf("<");
        if (opInd == -1)  opInd = it.indexOf("=");
        if (opInd == -1)  opInd = it.indexOf(">");

        if (!(ind < opInd && opInd + 1 < tmp))  throw wrongStatement();

        op = it.mid(opInd, 1);

        parser par;
        exp1 = par.getTree(it.mid(ind, opInd - ind));
        exp2 = par.getTree(it.mid(opInd + 1, tmp - opInd - 1));
        con = par.getTree(it.mid(tmp + 6));
        if (con->type() != CONSTANT)  throw wrongStatement();

        res = new IfStmt(exp1, op, exp2, con->getConstantValue());
    }

    else if (it.mid(ind) == "END"){
        res = new EndStmt();
    }

    else{
        throw wrongStatement();
    }


    } catch (wrongStatement){
        throw miniBasic::compileError("Incorrect statement");
    }

    return res;
}
