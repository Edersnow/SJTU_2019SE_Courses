/*
 * File: exp.h
 * -----------
 * This interface defines a class hierarchy for arithmetic expressions.
 */

#ifndef EXP_H
#define EXP_H


#include <QString>
#include "evalContext.h"

/*
 * Type: ExpressionType
 * --------------------
 * This enumerated type is used to differentiate the three different
 * expression types: CONSTANT, IDENTIFIER, and COMPOUND.
 */

enum ExpressionType { NULLEXP, CONSTANT, IDENTIFIER, COMPOUND };

/*
 * Class: Expression
 * -----------------
 * This class is used to represent a node in an expression tree.
 * Expression itself is an abstract class.  Every Expression object
 * is therefore created using one of the three concrete subclasses:
 * ConstantExp, IdentifierExp, or CompoundExp.
 */

class Expression {

public:

    Expression() = default;
    virtual ~Expression() = default;
    virtual int eval(EvaluationContext & context) = 0;
    virtual QString toString(int) = 0;
    virtual ExpressionType type() = 0;

/* Getter methods for convenience */

    virtual int getConstantValue();
    virtual QString getIdentifierName();
    virtual QString getOperator();
    virtual Expression *getLHS();
    virtual Expression *getRHS();

};


/*
 * Class: ConstantExp
 * ------------------
 * This subclass represents a constant integer expression.
 */

class ConstantExp: public Expression {

public:

    ConstantExp(int);
    virtual ~ConstantExp() = default;

    virtual int eval(EvaluationContext & context);
    virtual QString toString(int);
    virtual ExpressionType type();

    virtual int getConstantValue();

private:

    int value;

};


/*
 * Class: IdentifierExp
 * --------------------
 * This subclass represents a expression corresponding to a variable.
 */

class IdentifierExp: public Expression {

public:

    IdentifierExp(QString);
    virtual ~IdentifierExp() = default;

    virtual int eval(EvaluationContext & context);
    virtual QString toString(int);
    virtual ExpressionType type();

    virtual QString getIdentifierName();

private:

    QString name;

};


class CompoundExp: public Expression {

public:

    CompoundExp(QString op, Expression *lhs, Expression *rhs);
    virtual ~CompoundExp();

    virtual int eval(EvaluationContext & context);
    virtual QString toString(int);
    virtual ExpressionType type();

    virtual QString getOperator();
    virtual Expression *getLHS();
    virtual Expression *getRHS();

private:

    QString op;
    Expression *lhs, *rhs;

};





#endif // EXP_H
