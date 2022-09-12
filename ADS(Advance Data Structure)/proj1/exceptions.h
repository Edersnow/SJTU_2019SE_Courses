#ifndef EXCEPTIONS_H
#define EXCEPTIONS_H

#include <QString>

namespace miniBasic {

class exceptions{
protected:
    QString lineMsg;
    QString msg;

public:
    exceptions(QString other):  lineMsg(""), msg(other){}
    void setLine(int num)  {lineMsg = "Line " + QString::number(num, 10) + ": ";}
    virtual QString getMessage()  {return lineMsg + msg;}
};


class runtimeError: public exceptions{
protected:
    const QString proxy = "Runtime Error: ";

public:
    runtimeError(QString other):  exceptions(other){}
    virtual QString getMessage()  {return lineMsg + proxy + msg;}
};


class compileError: public exceptions{
protected:
    const QString proxy = "Compile Error: ";

public:
    compileError(QString other):  exceptions(other){}
    virtual QString getMessage()  {return lineMsg + proxy + msg;}
};

class fatalError: public exceptions{
protected:
    const QString proxy = "Program Error: ";

public:
    fatalError(QString other):  exceptions(other){}
    virtual QString getMessage()  {return lineMsg + proxy + msg;}
};



}

#endif // EXCEPTIONS_H
