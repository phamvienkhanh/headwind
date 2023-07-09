import QtQuick
import QtQuick.Controls
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects

Popup {
    id: rootItem

    property int offset: 10
    property list<string> strategies: ["top", "right", "bottom", "left"]
    property Item target
    property string text

    function updatePos() {
        if (rootItem.target && rootItem.target.parent) {
            const tg = rootItem.target;
            const tgPos = tg.parent.mapToItem(Overlay.overlay, tg.x, tg.y);
            const pH = rootItem.parent.height;
            const pW = rootItem.parent.width;
            let aPos;
            function adjustVertical() {
                let y = tgPos.y + (tg.height - rootItem.height) / 2;
                let aY = (rootItem.height - rootItem.offset) / 2;
                if (y < 0) {
                    if (tgPos.y + tg.height - rootItem.offset > 0) {
                        y = 0;
                        let mdo = (tgPos.y + tg.height / 2) - (rootItem.y + rootItem.height / 2);
                        aY = (rootItem.height - rootItem.offset) / 2 + mdo;
                        aY = Math.max(aY, 0);
                    } else {
                        return undefined;
                    }
                } else if (y + rootItem.height > pH) {
                    if (tgPos.y + rootItem.offset < pH) {
                        y = pH - rootItem.height;
                        let mdo = (tgPos.y + tg.height / 2) - (rootItem.y + rootItem.height / 2);
                        aY = (rootItem.height - rootItem.offset) / 2 + mdo;
                        aY = Math.min(aY, rootItem.height - rootItem.offset);
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
                let aX = (rootItem.width - rootItem.offset) / 2;
                if (x < 0) {
                    if (tgPos.x + tg.width - rootItem.offset > 0) {
                        x = 0;
                        let mdo = (tgPos.x + tg.width / 2) - (rootItem.x + rootItem.width / 2);
                        aX = (rootItem.width - rootItem.offset) / 2 + mdo;
                        aX = Math.max(aX, 0);
                    } else {
                        return undefined;
                    }
                } else if (x + rootItem.width > pW) {
                    if (tgPos.x + rootItem.offset < pW) {
                        x = pW - rootItem.width;
                        let mdo = (tgPos.x + tg.width / 2) - (rootItem.x + rootItem.width / 2);
                        aX = (rootItem.width - rootItem.offset) / 2 + mdo;
                        aX = Math.min(aX, rootItem.width - rootItem.offset);
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
                let y = tgPos.y - rootItem.height - rootItem.offset;
                if (y < 0) {
                    return undefined;
                }
                let p = adjustHorizontal();
                if (p === undefined) {
                    return undefined;
                }
                triangle.x = p.aX;
                triangle.y = rootItem.height;
                triangle.rotation = 0;
                return Qt.point(p.x, y);
            }
            function adjustBottom() {
                let y = tgPos.y + tg.height + rootItem.offset;
                if (y + rootItem.height > pH) {
                    return undefined;
                }
                let p = adjustHorizontal();
                if (p === undefined) {
                    return undefined;
                }
                triangle.x = p.aX;
                triangle.y = -rootItem.offset;
                triangle.rotation = 180;
                return Qt.point(p.x, y);
            }
            function adjustRight() {
                let p = adjustVertical();
                if (p === undefined) {
                    return undefined;
                }
                let x = tgPos.x + tg.width + rootItem.offset;
                if (x + rootItem.width > pW) {
                    return undefined;
                }
                triangle.x = -rootItem.offset;
                triangle.y = p.aY;
                triangle.rotation = 90;
                return Qt.point(x, p.y);
            }
            function adjustLeft() {
                let p = adjustVertical();
                if (p === undefined) {
                    return undefined;
                }
                let x = tgPos.x - rootItem.width - offset;
                if (x < 0) {
                    return undefined;
                }
                triangle.x = rootItem.width;
                triangle.y = p.aY;
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
        color: "transparent"
        implicitHeight: t.height
        implicitWidth: t.width

        Text {
            id: t

            color: "white"
            padding: 10
            text: rootItem.text
        }
    }
    Behavior on scale  {
        NumberAnimation {
            duration: 100
            easing.type: Easing.OutBack
        }
    }

    Component.onCompleted: {
        if (rootItem.target && rootItem.target.parent) {
            rootItem.target.onXChanged.connect(() => updatePos());
            rootItem.target.onYChanged.connect(() => updatePos());
        }
        updatePos();
    }

    Shape {
        id: triangle

        height: width
        visible: rootItem.visible
        width: rootItem.offset

        Component.onCompleted: {
            console.log("triangle.renderType ", triangle.rendererType);
        }

        ShapePath {
            fillColor: "#408E91"
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

        Rectangle {
            color: rootItem.background.color
            height: rootItem.background.border.width
            width: parent.width - 1.5
            x: 1
            y: -height
        }
    }
}
