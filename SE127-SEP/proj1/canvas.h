#ifndef CANVAS_H
#define CANVAS_H

#include <QWidget>
#include "gameboard.h"

class Canvas : public QWidget
{
    Q_OBJECT

private:
    Game_Board::Block_Status Board[Game_Board::Board_Size][Game_Board::Board_Size];

public:
    explicit Canvas(QWidget *parent = nullptr);

    //copy board from other
    void setBoard(Game_Board::Block_Status other[][Game_Board::Board_Size]);

protected:
    void paintEvent(QPaintEvent *) override;

signals:

};

#endif // CANVAS_H
