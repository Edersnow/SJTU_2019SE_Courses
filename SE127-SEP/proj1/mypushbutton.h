#ifndef MYPUSHBUTTOM_H
#define MYPUSHBUTTOM_H

#include <QPushButton>
#include <QString>

class MyPushButton : public QPushButton
{
    Q_OBJECT
public:
    explicit MyPushButton(QString, QString, QString = "");
    void setDisabled();
    void setNormal();
    bool isDisabled();

signals:


private:
    enum Status {Able, Disabled};

    //store image path
    QString Normal_Path;
    QString Press_Path;
    QString Disabled_Path;

    //status of button
    Status status;

protected:
    void mousePressEvent(QMouseEvent *) override;
    void mouseReleaseEvent(QMouseEvent *) override;
};

#endif // MYPUSHBUTTOM_H
