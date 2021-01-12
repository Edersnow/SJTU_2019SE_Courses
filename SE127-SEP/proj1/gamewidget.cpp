#include "gamewidget.h"
#include <QPainter>

GameWidget::GameWidget(QWidget *parent) : QWidget(parent)
{
    //set size
    setFixedSize(1080, 720);
}

void GameWidget::paintEvent(QPaintEvent *){

    //set background image
    QPainter painter(this);
    QPixmap img;
    img.load(":/img/GameWindow.png");
    painter.drawPixmap(0, 0, img);
}
