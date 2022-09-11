#ifndef BUTTONSET_H
#define BUTTONSET_H

#include <QWidget>
#include "gameboard.h"
#include "choiceitem.h"

class ButtonSet : public QWidget
{
    Q_OBJECT
public:
    explicit ButtonSet(QWidget *parent = nullptr);

signals:
    void changeChoice(ChoiceItem::Choices);

private:
    ChoiceItem *barrier;
    ChoiceItem *food;
    ChoiceItem *heart;
    ChoiceItem *fast;
    ChoiceItem *slow;
    ChoiceItem *eraser;

    //set all Choices Normal image
    void setDefaultAll();

public slots:
    //set one Choice Pressed
    void setStatus(ChoiceItem::Choices);
};

#endif // BUTTONSET_H
