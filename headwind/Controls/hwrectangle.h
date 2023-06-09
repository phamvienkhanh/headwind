#ifndef HEADWIND_H
#define HEADWIND_H

#include <QtQuick/QQuickPaintedItem>
#include <Utils/macros.h>

class HwRectangle : public QQuickPaintedItem
{
    Q_OBJECT
    QML_ELEMENT
    Q_DISABLE_COPY(HwRectangle)

    Q_PROPERTY_AUTO(QColor, color)
    Q_PROPERTY_AUTO(qreal, boderWidth)
    Q_PROPERTY_AUTO(QColor, boderColor)
    Q_PROPERTY_AUTO(QList<qreal>, radius)

public:
    explicit HwRectangle(QQuickItem *parent = nullptr);
    void paint(QPainter *painter) override;
    ~HwRectangle() override;
};

#endif // HEADWIND_H
