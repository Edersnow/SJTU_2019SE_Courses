#include "buttonset.h"
#include <QPainter>

ButtonSet::ButtonSet(QWidget *parent) : QWidget(parent)
{
    //set style
    setFixedSize(54, 369);


    barrier = new ChoiceItem (ChoiceItem::Barrier, ":/img/ButtonBarrier.png", ":/img/ButtonBarrierChosen.png");
    food = new ChoiceItem (ChoiceItem::Food, ":/img/ButtonFood.png", ":/img/ButtonFoodChosen.png");
    heart = new ChoiceItem (ChoiceItem::Heart, ":/img/ButtonHeart.png", ":/img/ButtonHeartChosen.png");
    fast = new ChoiceItem (ChoiceItem::Fast, ":/img/ButtonFast.png", ":/img/ButtonFastChosen.png");
    slow = new ChoiceItem (ChoiceItem::Slow, ":/img/ButtonSlow.png", ":/img/ButtonSlowChosen.png");
    eraser = new ChoiceItem (ChoiceItem::Eraser, ":/img/ButtonEraser.png", ":/img/ButtonEraserChosen.png");


    //set style
    barrier->setParent(this);
    barrier->move(0, 0);
    barrier->setFocusPolicy(Qt::NoFocus);

    food->setParent(this);
    food->move(0, 63);
    food->setFocusPolicy(Qt::NoFocus);

    heart->setParent(this);
    heart->move(0, 126);
    heart->setFocusPolicy(Qt::NoFocus);

    fast->setParent(this);
    fast->move(0, 189);
    fast->setFocusPolicy(Qt::NoFocus);

    slow->setParent(this);
    slow->move(0, 252);
    slow->setFocusPolicy(Qt::NoFocus);

    eraser->setParent(this);
    eraser->move(0, 315);
    eraser->setFocusPolicy(Qt::NoFocus);



    //connect signals and slot
    connect(barrier, &ChoiceItem::mouseChoose, this, &ButtonSet::setStatus);
    connect(food, &ChoiceItem::mouseChoose, this, &ButtonSet::setStatus);
    connect(heart, &ChoiceItem::mouseChoose, this, &ButtonSet::setStatus);
    connect(fast, &ChoiceItem::mouseChoose, this, &ButtonSet::setStatus);
    connect(slow, &ChoiceItem::mouseChoose, this, &ButtonSet::setStatus);
    connect(eraser, &ChoiceItem::mouseChoose, this, &ButtonSet::setStatus);
}



void ButtonSet::setStatus(ChoiceItem::Choices targ){
    //set Normal image first
    setDefaultAll();

    //set selected item Pressed image
    switch (targ) {
    case ChoiceItem::Barrier:
        barrier->setChosen();
        break;

    case ChoiceItem::Food:
        food->setChosen();
        break;

    case ChoiceItem::Heart:
        heart->setChosen();
        break;

    case ChoiceItem::Fast:
        fast->setChosen();
        break;

    case ChoiceItem::Slow:
        slow->setChosen();
        break;

    case ChoiceItem::Eraser:
        eraser->setChosen();
        break;
    }

    //emit singals to mainWindow
    emit changeChoice(targ);
}



void ButtonSet::setDefaultAll(){
    barrier->setDefault();
    food->setDefault();
    heart->setDefault();
    fast->setDefault();
    slow->setDefault();
    eraser->setDefault();
}
