#include "menuwidget.h"
#include <QPainter>

MenuWidget::MenuWidget(QWidget *parent) : QWidget(parent)
{
    //set size
    setFixedSize(1080, 720);
}

void MenuWidget::paintEvent(QPaintEvent *){

    //set background image
    QPainter painter(this);
    QPixmap img;
    img.load(":/img/MainWindow.png");
    painter.drawPixmap(0, 0, img);
}
