import QtQuick
import QtQuick.Controls
import Headwind

Item {
    HwBaseItem {
        id: xxx

        columnSpacing: 5
        content.padding: 10
        content.spacing: 10
        height: {
            if (boundAutoSize.checkState !== Qt.Checked) {
                return boundH.text;
            }
            return autoSize.height;
        }
        width: {
            if (boundAutoSize.checkState !== Qt.Checked) {
                return boundW.text;
            }
            return autoSize.width;
        }
        x: 50
        y: 100

        background: Rectangle {
            id: bg

            color: xxx.hovered ? "deeppink" : "black"
            opacity: xxx.pressed ? 0.2 : 1

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    slot4x.color = "red";
                }
            }
        }
        slot1: Rectangle {
            id: slot1x

            height: visible ? slot1H.text : 0
            visible: slot1Show.checkState === Qt.Checked
            width: visible ? slot1W.text : 0

            Text {
                text: "slot1"
            }
        }
        slot2: Rectangle {
            height: visible ? slot2H.text : 0
            visible: slot2Show.checkState === Qt.Checked
            width: visible ? slot2W.text : 0

            Text {
                text: "slot2"
            }
        }
        slot3: Rectangle {
            height: visible ? slot3H.text : 0
            visible: slot3Show.checkState === Qt.Checked
            width: visible ? slot3W.text : 0

            Text {
                text: "slot3"
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onClicked: function (mouse) {
                    console.log("slot3 clicked");
                    bg.color = "red";
                }
                onHoveredChanged: {
                    parent.color = containsMouse ? "darkblue" : "white";
                }
            }
        }
        slot4: Rectangle {
            id: slot4x

            height: visible ? slot4H.text : 0
            visible: slot4Show.checkState === Qt.Checked
            width: visible ? slot4W.text : 0

            Text {
                text: "slot4"
            }
        }

        onClicked: {
        }
    }

    Column {
        anchors.right: parent.right
        spacing: 14
        width: 200
        y: 50

        Row {
            spacing: 4

            Text {
                anchors.verticalCenter: parent.verticalCenter
                rightPadding: 10
                text: "autoSize"
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                rightPadding: 10
                text: xxx.autoSize.width + "x" + xxx.autoSize.height
            }

            CheckBox {
                id: boundAutoSize

                checked: false
            }
        }

        Row {
            enabled: boundAutoSize.checkState !== Qt.Checked
            spacing: 4

            Text {
                anchors.verticalCenter: parent.verticalCenter
                rightPadding: 10
                text: "bound"
            }

            TextField {
                id: boundW

                text: "400"
                width: 40
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "x"
            }

            TextField {
                id: boundH

                text: "90"
                width: 40
            }
        }

        Row {
            spacing: 4

            Text {
                anchors.verticalCenter: parent.verticalCenter
                rightPadding: 10
                text: "slot1"
            }

            TextField {
                id: slot1W

                text: "40"
                width: 40
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "x"
            }

            TextField {
                id: slot1H

                text: "40"
                width: 40
            }

            CheckBox {
                id: slot1Show

                checked: true
            }
        }

        Row {
            spacing: 4

            Text {
                anchors.verticalCenter: parent.verticalCenter
                rightPadding: 10
                text: "slot2"
            }

            TextField {
                id: slot2W

                text: "40"
                width: 40
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "x"
            }

            TextField {
                id: slot2H

                text: "40"
                width: 40
            }

            CheckBox {
                id: slot2Show

                checked: true
            }
        }

        Row {
            spacing: 4

            Text {
                anchors.verticalCenter: parent.verticalCenter
                rightPadding: 10
                text: "slot3"
            }

            TextField {
                id: slot3W

                text: "200"
                width: 40
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "x"
            }

            TextField {
                id: slot3H

                text: "40"
                width: 40
            }

            CheckBox {
                id: slot3Show

                checked: true
            }
        }

        Row {
            spacing: 4

            Text {
                anchors.verticalCenter: parent.verticalCenter
                rightPadding: 10
                text: "slot4"
            }

            TextField {
                id: slot4W

                text: "40"
                width: 40
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "x"
            }

            TextField {
                id: slot4H

                text: "40"
                width: 40
            }

            CheckBox {
                id: slot4Show

                checked: true
            }
        }
    }
}
