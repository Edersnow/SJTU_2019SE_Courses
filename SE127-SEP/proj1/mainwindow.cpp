#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "QPainter"
#include "Exceptions.h"
#include <QFont>
#include <string>
#include <QMessageBox>
#include <QKeyEvent>
#include <QMouseEvent>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    Timer = new QTimer(this);


    //set window's properties
    this->setFixedSize(1080, 720);
    this->setWindowIcon(QPixmap(":/img/Icon.png"));
    this->setWindowTitle( tr("Snake") );


    //init Board
    resetBoard();


    //init Menu/Game/Edit
    setMenu();
    setGame();
    setEdit();


    //hide Game and Edit
    Game->setVisible(false);
    Edit->setVisible(false);
    //when timeout->request animate
    connect(Timer, &QTimer::timeout, this, &MainWindow::animate);
    connect(this, &MainWindow::requestPaintCanvas1, Canvas1, QOverload<>::of(&Canvas::update));
}





void MainWindow::setMenu(){
    Menu = new MenuWidget;
    Menu->setParent(this);



    //init singleMode button
    Single_Mode = new MyPushButton (":/img/SingleMode.png", ":/img/SingleModeClicked.png");
    Single_Mode->setParent(Menu);
    Single_Mode->move(360, 283);
    Single_Mode->setFocusPolicy(Qt::NoFocus);
    connect(Single_Mode, &MyPushButton::clicked, [=](){

        //in case that the board is full
        try {
            //init Core and get map&information
            Core.init(Board, 1, Game_Board::Single);
            Core.get_current_board(Board);
            Core.get_current_information(Information);
            menu2Game();

        }  catch (board_is_full) {
            //when board is full
            QMessageBox::warning(this, "Warning", "The board is full, please create some space!");
        }
    });



    //init VsComputer button
    Vs_Computer = new MyPushButton (":/img/VsComputer.png", ":/img/VsComputerClicked.png");
    Vs_Computer->setParent(Menu);
    Vs_Computer->move(360, 363);
    Vs_Computer->setFocusPolicy(Qt::NoFocus);
    connect(Vs_Computer, &MyPushButton::clicked, [=](){

        //in case that the board is full
        try {
            //init Core and get map&information
            Core.init(Board, 2, Game_Board::AI);
            Core.get_current_board(Board);
            Core.get_current_information(Information);
            menu2Game();

        }  catch (board_is_full) {
            //when board is full
            QMessageBox::warning(this, "Warning", "The board is full, please create some space!");
        }
    });



    //init VsHuman button
    Vs_Human = new MyPushButton (":/img/VsHuman.png", ":/img/VsHumanClicked.png");
    Vs_Human->setParent(Menu);
    Vs_Human->move(360, 443);
    Vs_Human->setFocusPolicy(Qt::NoFocus);
    connect(Vs_Human, &MyPushButton::clicked, [=](){

        //in case that the board is full
        try {
            //init Core and get map&information
            Core.init(Board, 2, Game_Board::Human);
            Core.get_current_board(Board);
            Core.get_current_information(Information);
            menu2Game();

        }  catch (board_is_full) {
            //when board is full
            QMessageBox::warning(this, "Warning", "The board is full, please create some space!");
        }
    });



    //init Load1 button
    Load1 = new MyPushButton (":/img/Load1.png", ":/img/Load1Clicked.png", ":/img/Load1Disabled.png");
    Load1->setParent(Menu);
    Load1->move(360, 523);
    Load1->setFocusPolicy(Qt::NoFocus);

    //judge weather the game data file is existing
    Core.get_current_information(Information);
    if (!Information.File_is_Existing){
        Load1->setDisabled();
    }
    //when click just readfile and continue last game
    connect(Load1, &MyPushButton::clicked, [=](){
        if (!Load1->isDisabled()){
            Core.read_file();
            Core.get_current_board(Board);
            Core.get_current_information(Information);
            menu2Game();
        }
    });



    //init Modify1 button
    Modify1 = new MyPushButton (":/img/Modify1.png", ":/img/Modify1Clicked.png");
    Modify1->setParent(Menu);
    Modify1->move(999, 639);
    Modify1->setFocusPolicy(Qt::NoFocus);

    //menu -> edit
    connect(Modify1, &MyPushButton::clicked, [=](){
        ReturnTarget = menu;
        Buttons->setStatus(ChoiceItem::Barrier);
        Canvas2->setBoard(Board);
        Canvas2->update();

        Edit->setVisible(true);
        Menu->setVisible(false);
    });
}






void MainWindow::setGame(){
    Game = new GameWidget;
    Game->setParent(this);



    //init Restart button
    Restart = new MyPushButton (":/img/Restart.png", ":/img/RestartClicked.png");
    Restart->setParent(Game);
    Restart->move(675, 99);
    Restart->setFocusPolicy(Qt::NoFocus);
    //restart the game
    connect(Restart, &MyPushButton::clicked, [=](){
        //case: game is still running
        if (Timer->isActive()){
            Timer->stop();

            resetBoard();
            Core.init(Board, Information.Snake_Number, Information.Cur_Mode);
            Core.get_current_board(Board);
            Core.get_current_information(Information);
            Canvas1->setBoard(Board);
            Stop->setVisible(true);
            Start->setVisible(false);

            updateHP();
            emit requestPaintCanvas1();

            Timer->start(RefreshInterval);
        }
        //case: game stop/over
        else{
            resetBoard();
            Core.init(Board, Information.Snake_Number, Information.Cur_Mode);
            Core.get_current_board(Board);
            Core.get_current_information(Information);
            Canvas1->setBoard(Board);

            updateHP();
            emit requestPaintCanvas1();
        }
    });



    //init Stop button
    Stop = new MyPushButton (":/img/Stop.png", ":/img/StopClicked.png");
    Stop->setParent(Game);
    Stop->move(756, 99);
    Stop->setFocusPolicy(Qt::NoFocus);
    //stop the game
    connect(Stop, &MyPushButton::clicked, [=](){
        Timer->stop();

        Modify2->setNormal();
        Save->setNormal();
        if (Information.File_is_Existing){
            Load2->setNormal();
        }
        Start->setVisible(true);
        Stop->setVisible(false);
    });



    //init Start button
    Start = new MyPushButton (":/img/Start.png", ":/img/StartClicked.png");
    Start->setParent(Game);
    Start->move(756, 99);
    Start->setFocusPolicy(Qt::NoFocus);
    Start->setVisible(false);
    //start the game
    connect(Start, &MyPushButton::clicked, [=](){
        //case game over: restart
        if (Information.End_Flag){
            resetBoard();
            Core.init(Board, Information.Snake_Number, Information.Cur_Mode);
            Core.get_current_board(Board);
            Core.get_current_information(Information);
            Canvas1->setBoard(Board);
            Stop->setVisible(true);
            Start->setVisible(false);

            updateHP();
            emit requestPaintCanvas1();

            Timer->start(RefreshInterval);
        }
        //case normal
        else{
            Timer->start(RefreshInterval);

            Modify2->setDisabled();
            Save->setDisabled();
            Load2->setDisabled();
            Stop->setVisible(true);
            Start->setVisible(false);
        }
    });



    //init Modify2 button
    Modify2 = new MyPushButton (":/img/Modify2.png", ":/img/Modify2Clicked.png", ":/img/Modify2Disabled.png");
    Modify2->setParent(Game);
    Modify2->move(837, 99);
    Modify2->setDisabled();
    Modify2->setFocusPolicy(Qt::NoFocus);
    //game -> edit
    connect(Modify2, &MyPushButton::clicked, [=](){
        ReturnTarget = game;
        Buttons->setStatus(ChoiceItem::Barrier);
        Canvas2->setBoard(Board);
        Canvas2->update();

        Edit->setVisible(true);
        Menu->setVisible(false);
    });



    //init Return1 button
    Return1 = new MyPushButton (":/img/Return.png", ":/img/ReturnClicked.png");
    Return1->setParent(Game);
    Return1->move(918, 99);
    Return1->setFocusPolicy(Qt::NoFocus);
    //game -> menu
    connect(Return1, &MyPushButton::clicked, [=](){
        Timer->stop();

        HP1->setText("");
        HP1->update();
        HP2->setText("");
        HP2->update();
        resetBoard();
        Menu->setVisible(true);
        Game->setVisible(false);
    });



    //init Load2 button
    Load2 = new MyPushButton (":/img/Load2.png", ":/img/Load2Clicked.png", ":/img/Load2Disabled.png");
    Load2->setParent(Game);
    Load2->move(675, 181);
    Load2->setDisabled();
    Load2->setFocusPolicy(Qt::NoFocus);
    //load game data file
    connect(Load2, &MyPushButton::clicked, [=](){
        if (!Load2->isDisabled()){
            Core.read_file();
            Core.get_current_information(Information);
            Core.get_current_board(Board);
            Canvas1->setBoard(Board);

            updateHP();
            emit requestPaintCanvas1();
        }
    });



    //init Save button
    Save = new MyPushButton (":/img/Save.png", ":/img/SaveClicked.png", ":/img/SaveDisabled.png");
    Save->setParent(Game);
    Save->move(837, 181);
    Save->setDisabled();
    Save->setFocusPolicy(Qt::NoFocus);
    //save game data to file
    connect(Save, &MyPushButton::clicked, [=](){
        if (!Save->isDisabled()){
            Core.save_file();
            Core.get_current_information(Information);
            if (Information.File_is_Existing){
                Load1->setNormal();
                Load2->setNormal();
            }
        }
    });



    //init Canvas1
    Canvas1 = new Canvas;
    Canvas1->setParent(Game);
    Canvas1->move(90, 90);



    //init HP1 and HP2 label
    HP1 = new QLabel;
    HP2 = new QLabel;
    HP1->setParent(Game);
    HP2->setParent(Game);

    HP1->move(810, 254);
    HP2->move(810, 313);
    HP1->setFixedSize(90, 90);
    HP2->setFixedSize(90, 90);

    QFont setF("Comic Sans MS", 28, 75);
    HP1->setFont(setF);
    HP1->setAlignment(Qt::AlignRight);
    HP1->setStyleSheet("color: rgb(97,192,191)");
    HP2->setFont(setF);
    HP2->setAlignment(Qt::AlignRight);
    HP2->setStyleSheet("color: rgb(235,143,143)");

    HP1->setText("");
    HP1->update();
    HP2->setText("");
    HP2->update();
}





void MainWindow::setEdit(){
    Edit = new EditWidget;
    Edit->setParent(this);



    //init Canvas2 button
    Canvas2 = new Canvas;
    Canvas2->setParent(Edit);
    Canvas2->move(90, 90);



    //init Return2 button
    Return2 = new MyPushButton (":/img/Return.png", ":/img/ReturnClicked.png");
    Return2->setParent(Edit);
    Return2->move(918, 99);
    Return2->setFocusPolicy(Qt::NoFocus);
    //edit -> menu or game
    connect(Return2, &MyPushButton::clicked, [=](){
        //edit -> menu
        if (ReturnTarget == menu){
            Menu->setVisible(true);
            Edit->setVisible(false);
        }
        //edit -> game
        else{
            Game->setVisible(true);
            Edit->setVisible(false);
            Core.set_board(Board);
            Core.get_current_board(Board);
            Core.get_current_information(Information);

            Canvas1->setBoard(Board);
            Canvas1->update();
            updateHP();
        }
    });



    //init Buttons
    Buttons = new ButtonSet;
    Buttons->setParent(Edit);
    Buttons->move(711, 234);
    connect(Buttons, &ButtonSet::changeChoice, this, &MainWindow::setChoice);
}





void MainWindow::resetBoard(){
    memset(Board, Game_Board::Empty, sizeof (Game_Board::Block_Status) * Game_Board::Board_Size * Game_Board::Board_Size);
}





void MainWindow::menu2Game(){
    //display init situation
    Canvas1->setBoard(Board);
    updateHP();
    emit requestPaintCanvas1();

    //set buttons' status
    Stop->setVisible(true);
    Start->setVisible(false);
    Modify2->setDisabled();
    Save->setDisabled();
    Load2->setDisabled();

    Game->setVisible(true);
    Menu->setVisible(false);

    Timer->start(RefreshInterval);
}





void MainWindow::updateHP(){
    //update HP label
    HP1->setText(QString::number(Information.HP[0], 10));
    HP1->update();
    if (Information.Cur_Mode != Game_Board::Single){
        HP2->setText(QString::number(Information.HP[1], 10));
        HP2->update();
    }
    else {
        HP2->setText("");
        HP2->update();
    }
}





void MainWindow::setChoice(ChoiceItem::Choices targ){
    Chosen = targ;
}





void MainWindow::animate(){
    //if Player2 is AI, get next direction from ai
    if (Information.Cur_Mode == Game_Board::AI){
        Core.set_snake_direction(Game_Board::Snake1, ai.getNextDirection(Board, Core.get_snake_direction(Game_Board::Snake1)));
    }

    //set and get information from Core
    Core.run_to_next_status();
    Core.get_current_board(Board);
    Core.get_current_information(Information);

    //handle game over
    if (Information.End_Flag){
        Timer->stop();
        Start->setVisible(true);
        Stop->setVisible(false);
        Modify2->setDisabled();
        Save->setDisabled();
    }

    //for display
    Canvas1->setBoard(Board);
    updateHP();
    emit requestPaintCanvas1();
}





void MainWindow::keyPressEvent(QKeyEvent *event){
    //handle input
    int key = event->key();
    if (Timer->isActive()){
        //set for player1
        switch (key) {
        case Qt::Key_W:
            Core.set_snake_direction(Game_Board::Snake0, Game_Board::Up);
            break;

        case Qt::Key_A:
            Core.set_snake_direction(Game_Board::Snake0, Game_Board::Left);
            break;

        case Qt::Key_S:
            Core.set_snake_direction(Game_Board::Snake0, Game_Board::Down);
            break;

        case Qt::Key_D:
            Core.set_snake_direction(Game_Board::Snake0, Game_Board::Right);
            break;
        }
        //set for player2 (when VsHuman)
        if (Information.Cur_Mode == Game_Board::Human){
            switch (key) {
            case Qt::Key_Up:
                Core.set_snake_direction(Game_Board::Snake1, Game_Board::Up);
                break;

            case Qt::Key_Left:
                Core.set_snake_direction(Game_Board::Snake1, Game_Board::Left);
                break;

            case Qt::Key_Down:
                Core.set_snake_direction(Game_Board::Snake1, Game_Board::Down);
                break;

            case Qt::Key_Right:
                Core.set_snake_direction(Game_Board::Snake1, Game_Board::Right);
                break;
            }
        }
    }
}





void MainWindow::mouseReleaseEvent(QMouseEvent *e){
    int x = e->x();
    int y = e->y();

    if (x >= 90 && x < 630 && y >= 90 && y < 630){
        //calculate corresponding coordinate
        x -= 90;
        y -= 90;
        x /= 36;
        y /= 36;

        //handle different cases
        switch (Chosen) {
        //only change board when this coordinate is empty
        case ChoiceItem::Barrier:
            if (Board[x][y] == Game_Board::Empty){
                Board[x][y] = Game_Board::Barrier;
            }
            break;

        case ChoiceItem::Food:
            if (Board[x][y] == Game_Board::Empty){
                Board[x][y] = Game_Board::Food;
            }
            break;

        case ChoiceItem::Heart:
            if (Board[x][y] == Game_Board::Empty){
                Board[x][y] = Game_Board::Heart;
            }
            break;

        case ChoiceItem::Fast:
            if (Board[x][y] == Game_Board::Empty){
                Board[x][y] = Game_Board::SpeedUp;
            }
            break;

        case ChoiceItem::Slow:
            if (Board[x][y] == Game_Board::Empty){
                Board[x][y] = Game_Board::SpeedDown;
            }
            break;

        //only erase foods and barrier
        case ChoiceItem::Eraser:
            switch (Board[x][y]) {
            case Game_Board::Empty:
            case Game_Board::Head1:
            case Game_Board::Body1:
            case Game_Board::Head2:
            case Game_Board::Body2:
                break;

            case Game_Board::Barrier:
            case Game_Board::Food:
            case Game_Board::Heart:
            case Game_Board::SpeedUp:
            case Game_Board::SpeedDown:
            case Game_Board::SlowOpponent:
                Board[x][y] = Game_Board::Empty;
                break;
            }
        }
        //display
        Canvas2->setBoard(Board);
        Canvas2->update();
    }
    return QMainWindow::mouseReleaseEvent(e);
}





MainWindow::~MainWindow()
{
    delete ui;
}

