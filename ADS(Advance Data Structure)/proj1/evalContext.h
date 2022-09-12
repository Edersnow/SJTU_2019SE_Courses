#ifndef EVALCONTEXT_H
#define EVALCONTEXT_H

#include <QString>
#include <QMap>

/*
 * Class: EvaluationContext
 * ------------------------
 * This class encapsulates the information that the evaluator needs to
 * know in order to evaluate an expression.
 */

class EvaluationContext {

public:

   void setIntValue(QString var, int value);
   void setStrValue(QString var, QString value);
   int getIntValue(QString var);
   QString getStrValue(QString var);
   bool existIntVariable(QString var);
   bool existStrVariable(QString var);
   QString getAllVariables();
   void clear();

private:

   QMap<QString, int> intSymbolTable;
   QMap<QString, QString> strSymbolTable;

};

#endif // EVALCONTEXT_H
