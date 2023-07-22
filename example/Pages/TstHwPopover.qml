import QtQuick
import Headwind

Rectangle {
    Rectangle {
        id: rectTarget

        color: "red"
        height: 100
        width: 50
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

    Column {
        Rectangle {
            id: rectTarget2

            color: "darkblue"
            height: 100
            width: 50
            x: 200
            y: 300

            MouseArea {
                id: dragArea2

                anchors.fill: parent
                drag.target: parent
                hoverEnabled: true

                onHoveredChanged: {
                    if (containsMouse) {
                        popover2.open();
                    } else {
                        popover2.close();
                    }
                }
            }
        }

        HwPopover {
            id: popover2

            bottomPadding: 20
            target: rectTarget2
            text: "--o0o-- this is a HwPopover --o0o--"
            topPadding: 30

            content: Rectangle {
                implicitHeight: 200
                implicitWidth: 200
                radius: 20
            }
        }
    }
}
