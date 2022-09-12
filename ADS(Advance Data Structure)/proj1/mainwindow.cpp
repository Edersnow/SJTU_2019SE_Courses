#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QFileDialog>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    interpreter = new program(this);
    ui->codeInput->setReadOnly(true);
    ui->resultWidget->setReadOnly(true);
    ui->synTreeWidget->setReadOnly(true);

    //connect buttons
    connect(ui->loadButton, &QPushButton::clicked, this, &MainWindow::handleLoadPush);
    connect(ui->runButton, &QPushButton::clicked, interpreter, &program::runCode);
    connect(ui->debugButton, &QPushButton::clicked, interpreter, &program::debugCode);
    connect(ui->clearButton, &QPushButton::clicked, interpreter, &program::clear);

    //connect display signal to widget
    connect(interpreter, &program::showSyntaxTree, ui->synTreeWidget, &QPlainTextEdit::setPlainText);
    connect(interpreter, &program::showCodes, ui->codeInput, &QPlainTextEdit::setPlainText);
    connect(interpreter, &program::appendResult, ui->resultWidget, &QPlainTextEdit::appendPlainText);
    connect(interpreter, &program::showVariables, ui->variableWidget, &QPlainTextEdit::setPlainText);
    connect(interpreter, &program::showCEHighlight, this, &MainWindow::handleShowCEHighlight);
    connect(interpreter, &program::showStepHighlight, this, &MainWindow::handleShowStepHighlight);
    connect(interpreter, &program::popHighlight, this, &MainWindow::handlePopHighlight);

    //handle clear command
    connect(interpreter, &program::clearWidget, this, &MainWindow::handleClearWidget);

    //handle return signal
    connect(ui->commandInput, &QLineEdit::returnPressed, this, &MainWindow::handleReturnPressed);

    //handle quit command
    connect(interpreter, &program::quit, this, &MainWindow::close);

    //handle input command (disable the buttons)
    connect(interpreter, &program::requestInput, this, &MainWindow::handleInputRequest);
    //enable the buttons
    connect(interpreter, &program::enableAllButton, this, &MainWindow::handleEnableAllButton);
    connect(interpreter, &program::enableLoadClearInput, this, &MainWindow::handleEnableLoadClearInput);
    connect(interpreter, &program::disableLoadClearInput, this, &MainWindow::handleDisableLoadClearInput);

    //handle exceptions
    connect(interpreter, &program::REoccur, this, &MainWindow::handleRE);
    connect(interpreter, &program::CEoccur, this, &MainWindow::handleCE);
    connect(interpreter, &program::showMsg, this, &MainWindow::handleException);

}

MainWindow::~MainWindow()
{
    delete ui;
    delete interpreter;
}

void MainWindow::handleInputRequest(){
    ui->commandInput->setText(QString(" ? "));
    ui->runButton->setEnabled(false);
    ui->loadButton->setEnabled(false);
    ui->clearButton->setEnabled(false);
    ui->debugButton->setEnabled(false);
    ui->commandInput->setEnabled(true);
}

void MainWindow::handleReturnPressed(){
    if (!interpreter->receiveType && !interpreter->isDebuging){
        selectionList.clear();
        ui->codeInput->setExtraSelections(selectionList);
    }
    QString tmp = ui->commandInput->text();
    ui->commandInput->clear();
    interpreter->getInput(tmp);
}

void MainWindow::handleLoadPush(){
    ui->codeInput->setExtraSelections(QList<QTextEdit::ExtraSelection> ());
    interpreter->loadCode();
}

void MainWindow::handleEnableAllButton(){
    ui->runButton->setEnabled(true);
    ui->loadButton->setEnabled(true);
    ui->clearButton->setEnabled(true);
    ui->debugButton->setEnabled(true);
}

void MainWindow::handleEnableLoadClearInput(){
    ui->loadButton->setEnabled(true);
    ui->clearButton->setEnabled(true);
    ui->commandInput->setEnabled(true);
}

void MainWindow::handleDisableLoadClearInput(){
    ui->loadButton->setEnabled(false);
    ui->clearButton->setEnabled(false);
    ui->commandInput->setEnabled(false);
}

void MainWindow::handleClearWidget(){
    selectionList.clear();
    ui->codeInput->clear();
    ui->resultWidget->clear();
    ui->synTreeWidget->clear();
    ui->variableWidget->clear();
}

void MainWindow::handleShowCEHighlight(QVector<QPair<int, QColor>> *HL){
    QPlainTextEdit *codeWidget = ui->codeInput;
    QTextCursor cursor(codeWidget->document());

    selectionList.clear();
    for (auto &it: *HL){
        QTextEdit::ExtraSelection h;
        h.cursor = cursor;
        h.cursor.setPosition(it.first);
        h.cursor.movePosition(QTextCursor::StartOfLine);
        h.cursor.movePosition(QTextCursor::EndOfLine);
        h.format.setProperty(QTextFormat::FullWidthSelection, true);
        h.format.setBackground(it.second);
        selectionList.append(h);
    }

    codeWidget->setExtraSelections(selectionList);
}

void MainWindow::handleShowStepHighlight(int first, QColor* second){
    QPlainTextEdit *codeWidget = ui->codeInput;
    QTextCursor cursor(codeWidget->document());

    QTextEdit::ExtraSelection h;
    h.cursor = cursor;
    h.cursor.setPosition(first);
    h.cursor.movePosition(QTextCursor::StartOfLine);
    h.cursor.movePosition(QTextCursor::EndOfLine);
    h.format.setProperty(QTextFormat::FullWidthSelection, true);
    h.format.setBackground(*second);
    selectionList.append(h);

    codeWidget->setExtraSelections(selectionList);
}

void MainWindow::handlePopHighlight(){
    if (!selectionList.isEmpty()) {
        selectionList.pop_back();
    }
    ui->codeInput->setExtraSelections(selectionList);
}

void MainWindow::handleRE(miniBasic::runtimeError msg){
    ui->resultWidget->appendPlainText(msg.getMessage());
}

void MainWindow::handleCE(miniBasic::compileError msg){
    ui->resultWidget->appendPlainText(msg.getMessage());
}

void MainWindow::handleException(miniBasic::exceptions msg){
    ui->resultWidget->appendPlainText(msg.getMessage());
}
