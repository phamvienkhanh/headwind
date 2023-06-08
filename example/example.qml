import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material
import Headwind

Window {
    width: 1000
    height: 1000
    visible: true
    title: qsTr("Example Project")
    color: "grey"

    Rectangle {
        x: 450
        y: 100
        width: 300
        height: 300
        color: "red"
        border.width: 2
        border.color: "cyan"
        radius: 150
    }

    //    Rectangle {
    //        anchors.fill: roundrec
    //        color: "black"
    //    }
    Headwind {
        id: roundrec
        x: 100
        y: 100
        width: 300
        height: 300
        opacity: 0.5
    }
}
