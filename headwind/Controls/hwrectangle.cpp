#include "hwrectangle.h"

#include <QDirIterator>
#include <QPainter>
#include <QPainterPath>

HwRectangle::HwRectangle(QQuickItem *parent) : QQuickPaintedItem(parent)
{
    _color = QColorConstants::White;
    _boderColor = QColorConstants::White;
    _boderWidth = 0;
    _radius = {0, 0, 0, 0};

    connect(this, &HwRectangle::radiusChanged, this, [&]() { update(); });
    connect(this, &HwRectangle::boderWidthChanged, this, [&]() { update(); });
    connect(this, &HwRectangle::colorChanged, this, [&]() { update(); });
    connect(this, &HwRectangle::boderColorChanged, this, [&]() { update(); });

    //    QDirIterator it(":", QDirIterator::Subdirectories);
    //    while (it.hasNext()) {
    //        qDebug() << it.next();
    //    }
}

void HwRectangle::paint(QPainter *painter)
{
    painter->setRenderHint(QPainter::Antialiasing);

    qreal x = qRound(_boderWidth / 2);
    qreal y = qRound(_boderWidth / 2);
    qreal w = _boderWidth ? width() - _boderWidth - 1 : width();
    qreal h = _boderWidth ? height() - _boderWidth - 1 : height();

    QPainterPath path;
    path.moveTo(x + _radius[0], y);
    if (_radius[0]) path.arcTo(x, y, 2 * _radius[0], 2 * _radius[0], 90.0, 90.0);

    path.lineTo(x, y + h - _radius[3]);
    if (_radius[3]) path.arcTo(x, y + h - 2 * _radius[3], 2 * _radius[3], 2 * _radius[3], 180.0, 90.0);

    path.lineTo(x + w - _radius[2], y + h);
    if (_radius[2])
        path.arcTo(x + w - 2 * _radius[2], y + h - 2 * _radius[2], 2 * _radius[2], 2 * _radius[2], 270.0, 90.0);

    path.lineTo(x + w, y + _radius[1]);
    if (_radius[1]) path.arcTo(x + w - 2 * _radius[1], y, 2 * _radius[1], 2 * _radius[1], 0.0, 90.0);

    path.lineTo(x + _radius[0], y);

    QBrush brush(_color);
    painter->fillPath(path, brush);

    if (_boderWidth) {
        QPen pen(_boderColor, _boderWidth, Qt::SolidLine, Qt::SquareCap, Qt::MiterJoin);
        painter->strokePath(path, pen);
    }
}

HwRectangle::~HwRectangle() {}
