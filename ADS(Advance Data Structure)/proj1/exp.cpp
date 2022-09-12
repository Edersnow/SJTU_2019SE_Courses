#include "exp.h"
#include "exceptions.h"
#include <QtCore/qmath.h>



int Expression::getConstantValue(){
    return 0;
}

QString Expression::getIdentifierName(){
    return "";
}

QString Expression::getOperator(){
    return "";
}

Expression *Expression::getLHS(){
    return nullptr;
}

Expression *Expression::getRHS(){
    return nullptr;
}



ConstantExp::ConstantExp(int n)
    :value(n){}

int ConstantExp::eval(EvaluationContext &) {
   return value;
}

QString ConstantExp::toString(int t){
    return QString(" ").repeated(t) + QString::number(value, 10);
}

ExpressionType ConstantExp::type(){
    return CONSTANT;
}

int ConstantExp::getConstantValue(){
    return value;
}



IdentifierExp::IdentifierExp(QString n)
    :name(n){}

int IdentifierExp::eval(EvaluationContext & context) {
   if (!context.existIntVariable(name))  throw miniBasic::runtimeError(name + " is not a INT type variable.");
   return context.getIntValue(name);
}

QString IdentifierExp::toString(int t){
    return QString(" ").repeated(t) + name;
}

ExpressionType IdentifierExp::type(){
    return IDENTIFIER;
}

QString IdentifierExp::getIdentifierName(){
    return name;
}

CompoundExp::CompoundExp(QString op, Expression *lhs, Expression *rhs)
    :op(op), lhs(lhs), rhs(rhs){}

CompoundExp::~CompoundExp(){
    delete lhs;
    delete rhs;
}

int CompoundExp::eval(EvaluationContext & context) {
   int right = rhs->eval(context);
   if (op == "--")  return -right;

//inpossible type
//   if (op == "=") {
//      context.setValue(lhs->getIdentifierName(), right);
//      return right;
//   }

   int left = lhs->eval(context);

   if (op == "+")  return left + right;
   if (op == "-")  return left - right;
   if (op == "*")  return left * right;
   if (op == "**")  return qRound(qPow(left, right));
   if (op == "/") {
      if (right == 0)  throw miniBasic::runtimeError("Divide by 0");
      return left / right;
   }

   throw miniBasic::runtimeError("Illegal operator in expression");
   return 0;
}

QString CompoundExp::toString(int t){
    if (op == "--"){
        return QString(" ").repeated(t) + "-\n" + rhs->toString(t+2);
    }
    return QString(" ").repeated(t) + op + "\n" + lhs->toString(t+2) + "\n" + rhs->toString(t+2);
}

ExpressionType CompoundExp::type(){
    return COMPOUND;
}

QString CompoundExp::getOperator(){
    return op;
}

Expression *CompoundExp::getLHS(){
    return lhs;
}

Expression *CompoundExp::getRHS(){
    return rhs;
}


