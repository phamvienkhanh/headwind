#include "headwind.h"

#include <QPainter>
#include <QPainterPath>

Headwind::Headwind(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{
    // By default, QQuickItem does not draw anything. If you subclass
    // QQuickItem to create a visual item, you will need to uncomment the
    // following line and re-implement updatePaintNode()

    // setFlag(ItemHasContents, true);
}

void Headwind::paint(QPainter *painter)
{
    painter->setRenderHint(QPainter::Antialiasing);

    qreal boderw = 2;
    QVector<int> radius{20, 10, 80, 30};
    qreal x = qRound(boderw / 2);
    qreal y = qRound(boderw / 2);
    qreal w = width() - (boderw + 1);
    qreal h = height() - (boderw + 1);

    QPainterPath path;
    path.moveTo(x + radius[0], y);
    path.arcTo(x, y, 2 * radius[0], 2 * radius[0], 90.0, 90.0);

    path.lineTo(x, y + h - radius[0] - radius[3]);
    path.arcTo(x, y + h - 2 * radius[3], 2 * radius[3], 2 * radius[3], 180.0, 90.0);

    path.lineTo(x + w - radius[3] - radius[2], y + h);
    path.arcTo(x + w - 2 * radius[2],
               y + (h - 2 * radius[2]),
               2 * radius[2],
               2 * radius[2],
               270.0,
               90.0);

    path.lineTo(x + w, y + h - radius[2] - radius[1]);
    path.arcTo(x + w - 2 * radius[1], y, 2 * radius[1], 2 * radius[1], 0.0, 90.0);

    path.lineTo(x + radius[0], y);

    QPen pen(QColorConstants::Cyan, boderw);
    QBrush brush(QColorConstants::Red);

    painter->fillPath(path, brush);
    painter->strokePath(path, pen);
}

Headwind::~Headwind()
{
}
