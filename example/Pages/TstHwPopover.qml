import QtQuick
import Headwind

Rectangle {
    Rectangle {
        id: rectTarget

        color: "red"
        height: 60
        width: 100
        x: 120
        y: 120

        MouseArea {
            id: dragArea

            anchors.fill: parent
            drag.target: parent
            hoverEnabled: true

            onHoveredChanged: {
                if (containsMouse) {
                    popover.open();
                } else {
                    popover.close();
                }
            }
        }

        HwPopover {
            id: popover

            target: rectTarget
            text: "--o0o-- this is a HwPopover --o0o--"
        }
    }
}
