#ifndef MENUWIDGET_H
#define MENUWIDGET_H

#include <QWidget>

class MenuWidget : public QWidget
{
    Q_OBJECT
public:
    explicit MenuWidget(QWidget *parent = nullptr);

protected:
    void paintEvent(QPaintEvent *) override;

signals:

};

#endif // MENUWIDGET_H
