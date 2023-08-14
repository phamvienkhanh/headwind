import QtQuick
import QtQuick.Controls
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects

Popup {
    id: rootItem

    property Item content: Item {
        height: t.height
        width: t.width

        Text {
            id: t

            color: "white"
            padding: 10
            text: rootItem.text
        }
    }
    property Item indicator: Shape {
        id: triangle

        height: 50
        visible: rootItem.visible
        width: 15

        ShapePath {
            fillColor: "black"
            strokeColor: "transparent"
            strokeWidth: 0

            PathMove {
                x: triangle.width
                y: 0
            }

            PathLine {
                x: triangle.width / 2
                y: triangle.height
            }

            PathLine {
                x: 0
                y: 0
            }
        }
    }

    property list<string> strategies: ["right", "bottom", "top", "left"]
    property Item target
    property string text

    function updatePos() {
        if (rootItem.target && rootItem.target.parent) {
            const tg = rootItem.target;
            const tgPos = tg.parent.mapToItem(Overlay.overlay, tg.x, tg.y);
            const pH = rootItem.parent.height;
            const pW = rootItem.parent.width;
            const indicatorRotateOffset = (rootItem.indicator.width - rootItem.indicator.height)/2
            let aPos;
            function adjustVertical() {
                let y = tgPos.y + (tg.height - rootItem.height) / 2;
                let aY = y + (rootItem.height - rootItem.indicator.width) / 2;
                if (y < 0) {
                    if (tgPos.y + tg.height - rootItem.indicator.width > 0) {
                        y = 0;
                        let mdo = (tgPos.y + tg.height / 2) - (rootItem.y + rootItem.height / 2);
                        aY = (rootItem.height - rootItem.indicator.width) / 2 + mdo;
                        aY = Math.max(aY, 0);
                    } else {
                        return undefined;
                    }
                } else if (y + rootItem.height > pH) {
                    if (tgPos.y + rootItem.indicator.width < pH) {
                        y = pH - rootItem.height;
                        let mdo = (tgPos.y + tg.height / 2) - (rootItem.y + rootItem.height / 2);
                        aY = y + (rootItem.height - rootItem.indicator.width) / 2 + mdo;
                        aY = Math.min(aY, y + rootItem.height - rootItem.indicator.width);
                    } else {
                        return undefined;
                    }
                }
                return {
                    "y": y,
                    "aY": aY
                };
            }
            function adjustHorizontal() {
                let x = tgPos.x + (tg.width - rootItem.width) / 2;
                let aX = x + (rootItem.width - rootItem.indicator.height) / 2;
                if (x < 0) {
                    if (tgPos.x + tg.width - rootItem.indicator.height > 0) {
                        x = 0;
                        let mdo = (tgPos.x + tg.width / 2) - (rootItem.x + rootItem.width / 2);
                        aX = (rootItem.width - rootItem.indicator.height) / 2 + mdo;
                        aX = Math.max(aX, 0);
                    } else {
                        return undefined;
                    }
                } else if (x + rootItem.width > pW) {
                    if (tgPos.x + rootItem.indicator.height < pW) {
                        x = pW - rootItem.width;
                        let mdo = (tgPos.x + tg.width / 2) - (rootItem.x + rootItem.width / 2);
                        aX = x + (rootItem.width - rootItem.indicator.height) / 2 + mdo;
                        aX = Math.min(aX, x + rootItem.width - rootItem.indicator.height);
                    } else {
                        return undefined;
                    }
                }
                return {
                    "x": x,
                    "aX": aX
                };
            }
            function adjustTop() {
                let y = tgPos.y - rootItem.height - rootItem.indicator.height;
                if (y < 0) {
                    return undefined;
                }
                let p = adjustHorizontal();
                if (p === undefined) {
                    return undefined;
                }
                rootItem.indicator.x = p.aX - indicatorRotateOffset;
                rootItem.indicator.y = y + rootItem.height;
                rootItem.indicator.rotation = 0;
                return Qt.point(p.x, y);
            }
            function adjustBottom() {
                let y = tgPos.y + tg.height + rootItem.indicator.height;
                if (y + rootItem.height > pH) {
                    return undefined;
                }
                let p = adjustHorizontal();
                if (p === undefined) {
                    return undefined;
                }
                rootItem.indicator.x = p.aX - indicatorRotateOffset;
                rootItem.indicator.y = y - rootItem.indicator.height;
                triangle.rotation = 180;
                return Qt.point(p.x, y);
            }
            function adjustRight() {
                let p = adjustVertical();
                if (p === undefined) {
                    return undefined;
                }
                let x = tgPos.x + tg.width + rootItem.indicator.height;
                if (x + rootItem.width > pW) {
                    return undefined;
                }
                triangle.x = x - rootItem.indicator.height - indicatorRotateOffset;
                triangle.y = p.aY + indicatorRotateOffset;
                triangle.rotation = 90;
                return Qt.point(x, p.y);
            }
            function adjustLeft() {
                let p = adjustVertical();
                if (p === undefined) {
                    return undefined;
                }
                let x = tgPos.x - rootItem.width - rootItem.indicator.height;
                if (x < 0) {
                    return undefined;
                }
                triangle.x = x + rootItem.width - indicatorRotateOffset;
                triangle.y = p.aY + indicatorRotateOffset;
                triangle.rotation = -90;
                return Qt.point(x, p.y);
            }
            for (const elm of rootItem.strategies) {
                if (elm === "top") {
                    aPos = adjustTop();
                } else if (elm === "right") {
                    aPos = adjustRight();
                } else if (elm === "bottom") {
                    aPos = adjustBottom();
                } else if (elm === "left") {
                    aPos = adjustLeft();
                }
                if (aPos) {
                    break;
                }
            }
            if (aPos) {
                rootItem.x = aPos.x;
                rootItem.y = aPos.y;
            }
        }
    }

    closePolicy: Popup.NoAutoClose
    height: implicitHeight
    padding: 0
    parent: Overlay.overlay
    scale: visible ? 1 : 0
    width: implicitWidth

    background: Item {
        Rectangle {
            id: realBg

            anchors.fill: parent
            color: "#408E91"
            radius: 10
        }

        DropShadow {
            anchors.fill: parent
            color: "#80000000"
            horizontalOffset: 3
            radius: 8.0
            source: realBg
            verticalOffset: 3
        }
    }
    contentItem: Rectangle {
        color: "blue"
        data: [rootItem.content]
        implicitHeight: rootItem.content.height
        implicitWidth: rootItem.content.width
    }
    Behavior on scale  {
        NumberAnimation {
            duration: 100
            easing.type: Easing.OutBack
        }
    }

    Component.onCompleted: {
        if (rootItem.indicator) {
            rootItem.indicator.parent = rootItem.Overlay.overlay;
        }
        if (rootItem.target && rootItem.target.parent) {
            rootItem.target.onXChanged.connect(() => updatePos());
            rootItem.target.onYChanged.connect(() => updatePos());
        }
        updatePos();
    }
}
