#include "mypushbutton.h"

MyPushButton::MyPushButton(QString Normal, QString Press, QString Disabled){
    //set image path
    Normal_Path = Normal;
    Press_Path = Press;
    Disabled_Path = Disabled;
    status = Status::Able;

    //display Normal image
    QPixmap img;
    img.load(Normal_Path);

    setFixedSize(img.width(), img.height());
    setStyleSheet("QPushButton{border:0px;}");
    setIcon(img);
    setIconSize(QSize(img.width(), img.height()));
}



void MyPushButton::mousePressEvent(QMouseEvent *e){
    if (status == Status::Disabled){
        return;
    }

    //display Pressed image
    QPixmap img;
    img.load(Press_Path);
    setIcon(img);
    setIconSize(QSize(img.width(), img.height()));

    return QPushButton::mousePressEvent(e);
}



void MyPushButton::mouseReleaseEvent(QMouseEvent *e){
    if (status == Status::Disabled){
        return;
    }

    //display Normal image
    QPixmap img;
    img.load(Normal_Path);
    setIcon(img);
    setIconSize(QSize(img.width(), img.height()));

    return QPushButton::mouseReleaseEvent(e);
}



void MyPushButton::setDisabled(){
    if (status == Status::Disabled){
        return;
    }

    //set button disable
    status = Status::Disabled;
    QPixmap img;
    img.load(Disabled_Path);
    setIcon(img);
    setIconSize(QSize(img.width(), img.height()));
}



void MyPushButton::setNormal(){
    if (status != Status::Disabled){
        return;
    }

    //set button able
    status = Status::Able;
    QPixmap img;
    img.load(Normal_Path);
    setIcon(img);
    setIconSize(QSize(img.width(), img.height()));
}



bool MyPushButton::isDisabled(){
    return status == Status::Disabled;
}
