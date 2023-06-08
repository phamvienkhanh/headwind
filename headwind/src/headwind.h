#ifndef HEADWIND_H
#define HEADWIND_H

#include <QtQuick/QQuickPaintedItem>

class Headwind : public QQuickPaintedItem
{
    Q_OBJECT
    QML_ELEMENT
        Q_DISABLE_COPY(Headwind)
        public:
                 explicit Headwind(QQuickItem *parent = nullptr);
    void paint(QPainter *painter) override;
    ~Headwind() override;
};

#endif // HEADWIND_H
