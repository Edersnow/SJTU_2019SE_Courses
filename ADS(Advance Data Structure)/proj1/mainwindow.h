#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QTextEdit>
#include "program.h"


QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

public slots:
    //handle input request from interpreter
    //set command input widget " ? " and disable the buttons
    void handleInputRequest();

    //handle event that user presses return
    void handleReturnPressed();

    //handle load button
    void handleLoadPush();

    //enable the buttons
    void handleEnableAllButton();
    void handleEnableLoadClearInput();
    void handleDisableLoadClearInput();

    //clear all the widget
    void handleClearWidget();

    //handle show highlight
    void handleShowCEHighlight(QVector<QPair<int, QColor>> *);
    void handleShowStepHighlight(int, QColor *);
    void handlePopHighlight();

    //handle msgs from interpreter
    void handleRE(miniBasic::runtimeError);
    void handleCE(miniBasic::compileError);
    void handleException(miniBasic::exceptions);

private:
    Ui::MainWindow *ui;
    program *interpreter;
    QList<QTextEdit::ExtraSelection> selectionList;
};
#endif // MAINWINDOW_H
