#include "canvas.h"
#include <QPainter>
#include <string>

Canvas::Canvas(QWidget *parent) : QWidget(parent)
{
    //set style and set Board default
    setFixedSize(540, 540);
    memset(Board, Game_Board::Empty, sizeof (Game_Board::Block_Status) * Game_Board::Board_Size * Game_Board::Board_Size);
}



void Canvas::setBoard(Game_Board::Block_Status other[][Game_Board::Board_Size]){
    memcpy(Board, other, sizeof (Game_Board::Block_Status) * Game_Board::Board_Size * Game_Board::Board_Size);
}



void Canvas::paintEvent(QPaintEvent *){
    QPainter painter(this);
    QPixmap img;

    //define size of image
    int imgsize = 540 / Game_Board::Board_Size;

    for (int i=0; i<Game_Board::Board_Size; ++i){
        for (int j=0; j<Game_Board::Board_Size; ++j){

            //select image type
            switch (Board[i][j]) {
            case Game_Board::Empty:
                continue;

            case Game_Board::Barrier:
                img.load(":/img/Barrier.png");
                break;

            case Game_Board::Food:
                img.load(":/img/Food.png");
                break;

            case Game_Board::Heart:
                img.load(":/img/Heart.png");
                break;

            case Game_Board::SpeedUp:
                img.load(":/img/Fast.png");
                break;

            case Game_Board::SpeedDown:
                img.load(":/img/Slow.png");
                break;

            case Game_Board::SlowOpponent:
                img.load(":/img/Gift.png");
                break;

            case Game_Board::Head1:
                img.load(":/img/Head1.png");
                break;

            case Game_Board::Body1:
                img.load(":/img/Snake1.png");
                break;

            case Game_Board::Head2:
                img.load(":/img/Head2.png");
                break;

            case Game_Board::Body2:
                img.load(":/img/Snake2.png");
                break;
            }

            //present
            painter.drawPixmap(i * imgsize, j * imgsize, imgsize, imgsize, img);
        }
    }
}
