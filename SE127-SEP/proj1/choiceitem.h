#ifndef CHOICEITEM_H
#define CHOICEITEM_H

#include <QWidget>
#include <QPushButton>

class ChoiceItem : public QPushButton
{
    Q_OBJECT
public:
    //Define Choices
    enum Choices {Barrier, Food, Heart, Fast, Slow, Eraser};
    explicit ChoiceItem(Choices, QString, QString);

    //set Normal image & set Pressed image
    void setDefault();
    void setChosen();

signals:
    void mouseChoose(Choices);

private:
    //Recording the path of Normal image and Pressed image
    QString NormalPath;
    QString PressedPath;

    //Define which Choice is it
    Choices ItemName;

protected:
    void mousePressEvent(QMouseEvent *) override;
};

#endif // CHOICEITEM_H
