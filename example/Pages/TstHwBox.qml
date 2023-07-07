import QtQuick
import Headwind

Item {
    HwBox {
        id: box
        x: 100
        y: 100
        width: 400
        height: 60
        padding: 10        
        background: Rectangle {
            color: "black"
        }

        Rectangle {
            anchors.fill: parent
        }

        MouseArea {
            anchors.fill: parent
            parent: box.parent
            onClicked: {
                console.log("MouseArea clicked")
            }
        }
    }
}