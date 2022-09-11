#ifndef GAMEWIDGET_H
#define GAMEWIDGET_H

#include <QWidget>

class GameWidget : public QWidget
{
    Q_OBJECT
public:
    explicit GameWidget(QWidget *parent = nullptr);

signals:

protected:
    void paintEvent(QPaintEvent *) override;
};

#endif // GAMEWIDGET_H
