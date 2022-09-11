#include "editwidget.h"
#include <QPainter>

EditWidget::EditWidget(QWidget *parent) : QWidget(parent)
{
    //set size
    setFixedSize(1080, 720);
}

void EditWidget::paintEvent(QPaintEvent *){
    //set background image
    QPainter painter(this);
    QPixmap img;
    img.load(":/img/EditWindow.png");
    painter.drawPixmap(0, 0, img);
}
