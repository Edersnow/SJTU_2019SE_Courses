#ifndef EDITWIDGET_H
#define EDITWIDGET_H

#include <QWidget>

class EditWidget : public QWidget
{
    Q_OBJECT
public:
    explicit EditWidget(QWidget *parent = nullptr);

signals:

protected:
    void paintEvent(QPaintEvent *) override;
};

#endif // EDITWIDGET_H
