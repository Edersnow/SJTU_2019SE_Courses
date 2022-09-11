#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QTime>
#include <QTimer>
#include <QLabel>
#include "gameboard.h"
#include "menuwidget.h"
#include "gamewidget.h"
#include "mypushbutton.h"
#include "canvas.h"
#include "snakeai.h"
#include "editwidget.h"
#include "buttonset.h"

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

private:
    /**
     * Target: Definition of return target when exit from editing interface
     * RefreshInterval: Canvas1's refresh interval
     */
    enum Target {menu, game};
    const static int RefreshInterval = 30;

protected:
    void keyPressEvent(QKeyEvent *) override;
    void mouseReleaseEvent(QMouseEvent *) override;

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private:
    Ui::MainWindow *ui;

    Game_Board Core;
    Game_Board::Basic_Information_Package Information;
    Game_Board::Block_Status Board[Game_Board::Board_Size][Game_Board::Board_Size];
    Target ReturnTarget;

    SnakeAI ai;

    QTimer *Timer;

    //Menu interface part widgets
    MenuWidget *Menu;
    MyPushButton *Single_Mode;
    MyPushButton *Vs_Human;
    MyPushButton *Vs_Computer;
    MyPushButton *Load1;
    MyPushButton *Modify1;

    //Game interface part widgets
    GameWidget *Game;
    MyPushButton *Restart;
    MyPushButton *Stop;
    MyPushButton *Start;
    MyPushButton *Modify2;
    MyPushButton *Return1;
    MyPushButton *Load2;
    MyPushButton *Save;
    QLabel *HP1;
    QLabel *HP2;
    Canvas *Canvas1;

    //Edit interface part widgets
    EditWidget *Edit;
    Canvas *Canvas2;
    MyPushButton *Return2;
    ButtonSet *Buttons;
    ChoiceItem::Choices Chosen;


    //methods to initialize Menu/Game/Edit interface
    void setMenu();
    void setGame();
    void setEdit();
    //set the Board all empty
    void resetBoard();
    //the repeating part of work when menu->game
    void menu2Game();
    //update HP label
    void updateHP();


signals:
    //update canvas1
    void requestPaintCanvas1();

private slots:
    //set Chosen
    void setChoice(ChoiceItem::Choices);
    void animate();
};
#endif // MAINWINDOW_H
