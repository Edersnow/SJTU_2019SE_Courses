#include "choiceitem.h"

ChoiceItem::ChoiceItem(Choices Name, QString Normal, QString Pressed)
{
    QPixmap img;

    NormalPath = Normal;
    PressedPath = Pressed;
    ItemName = Name;

    //initially set Normal image
    img.load(NormalPath);

    //set style
    setFixedSize(img.width(), img.height());
    setStyleSheet("QPushButton{border:0px;}");
    setIcon(img);
    setIconSize(QSize(img.width(), img.height()));
}

//set Normal image
void ChoiceItem::setDefault(){
    QPixmap img;

    img.load(NormalPath);
    setIcon(img);
    setIconSize(QSize(img.width(), img.height()));
}

//set Pressed image
void ChoiceItem::setChosen(){
    QPixmap img;

    img.load(PressedPath);
    setIcon(img);
    setIconSize(QSize(img.width(), img.height()));
}

//emit when mouse press
void ChoiceItem::mousePressEvent(QMouseEvent *){
    emit mouseChoose(ItemName);
}
