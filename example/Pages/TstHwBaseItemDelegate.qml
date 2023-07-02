import QtQuick
import QtQuick.Controls
import Headwind

Item {

    HwBaseItemDelegate {
        id: xxx
        x: 50
        y: 100
        width: {
            if(boundAutoSize.checkState !== Qt.Checked) {
                return boundW.text
            }

            return autoSize.width
        }
        height: {
            if(boundAutoSize.checkState !== Qt.Checked) {
                return boundH.text
            }

            return autoSize.height
        }
        content.spacing: 10
        content.padding: 10
        centerColumn.spacing: 5

        slot1: Rectangle {
            width: visible ? slot1W.text : 0
            height: visible ? slot1H.text : 0  
            visible: slot1Show.checkState === Qt.Checked
            Text {
                text: "slot1"
            }
        }
        slot2: Rectangle {
            width: visible ? slot2W.text : 0
            height: visible ? slot2H.text : 0  
            visible: slot2Show.checkState === Qt.Checked
            Text {
                text: "slot2"
            }
        }
        slot3: Rectangle {
            width: visible ? slot3W.text : 0
            height: visible ? slot3H.text : 0  
            visible: slot3Show.checkState === Qt.Checked
            Text {
                text: "slot3"
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    parent.color = containsMouse ? "darkblue" : "white"
                }
                onClicked: function (mouse) {
                    console.log("slot3 clicked")
                }
            }
        }
        slot4: Rectangle {
            width: visible ? slot4W.text : 0
            height: visible ? slot4H.text : 0  
            visible: slot4Show.checkState === Qt.Checked
            Text {
                text: "slot4"
            }
        }

        background: Rectangle {
            color: xxx.hovered ? "deeppink" : "black"
            opacity: xxx.pressed ? 0.2 : 1
        }

        onClicked: {
            
        }
    }

    Column {
        y: 50
        width: 200
        spacing: 14
        anchors.right: parent.right

        Row {
            spacing: 4
            Text {
                text: "autoSize"
                rightPadding: 10
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                text: xxx.autoSize.width + "x" + xxx.autoSize.height
                rightPadding: 10
                anchors.verticalCenter: parent.verticalCenter
            }
            CheckBox {
                id: boundAutoSize
                checked: false
            }
        }

        Row {
            spacing: 4
            enabled: boundAutoSize.checkState !== Qt.Checked
            Text {
                text: "bound"
                rightPadding: 10
                anchors.verticalCenter: parent.verticalCenter
            }
            TextField {
                id: boundW
                width: 40
                text: "400"
            }
            Text {
                text: "x"
                anchors.verticalCenter: parent.verticalCenter
            }
            TextField {
                id: boundH
                width: 40
                text: "90"
            }            
        }

        Row {
            spacing: 4
            Text {
                text: "slot1"
                rightPadding: 10
                anchors.verticalCenter: parent.verticalCenter
            }
            TextField {
                id: slot1W
                width: 40
                text: "40"
            }
            Text {
                text: "x"
                anchors.verticalCenter: parent.verticalCenter
            }
            TextField {
                id: slot1H
                width: 40
                text: "40"
            }
            CheckBox {
                id: slot1Show
                checked: true
            }
        }

        Row {
            spacing: 4
            Text {
                text: "slot2"
                rightPadding: 10
                anchors.verticalCenter: parent.verticalCenter
            }
            TextField {
                id: slot2W
                width: 40
                text: "40"
            }
            Text {
                text: "x"
                anchors.verticalCenter: parent.verticalCenter
            }
            TextField {
                id: slot2H
                width: 40
                text: "40"
            }
            CheckBox {
                id: slot2Show
                checked: true
            }
        }

        Row {
            spacing: 4
            Text {
                text: "slot3"
                rightPadding: 10
                anchors.verticalCenter: parent.verticalCenter
            }
            TextField {
                id: slot3W
                width: 40
                text: "200"
            }
            Text {
                text: "x"
                anchors.verticalCenter: parent.verticalCenter
            }
            TextField {
                id: slot3H
                width: 40
                text: "40"
            }
            CheckBox {
                id: slot3Show
                checked: true
            }
        }

        Row {
            spacing: 4
            Text {
                text: "slot4"
                rightPadding: 10
                anchors.verticalCenter: parent.verticalCenter
            }
            TextField {
                id: slot4W
                width: 40
                text: "40"
            }
            Text {
                text: "x"
                anchors.verticalCenter: parent.verticalCenter
            }
            TextField {
                id: slot4H
                width: 40
                text: "40"
            }
            CheckBox {
                id: slot4Show
                checked: true
            }
        }
    }
}
