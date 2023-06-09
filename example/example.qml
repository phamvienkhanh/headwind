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

    Item {
        anchors.fill: parent

        //    Rectangle {
        //        x: 450
        //        y: 100
        //        width: 300
        //        height: 300
        //        color: "red"
        //        border.width: 2
        //        border.color: "cyan"
        //        radius: 150
        //    }

            //    Rectangle {
            //        anchors.fill: roundrec
            //        color: "black"
            //    }
        HwRectangle {
            id: roundrec
            x: 100
            y: 100
            width: 300
            height: 300
            radius: [0, 0, 0, 0]
            color: "cyan"
            boderColor: "red"
            boderWidth: 1
        }

        ColumnLayout {
            anchors.right: parent.right
            width: 200

            Text {
                text: "radius"
            }
            ColumnLayout {
                Slider {
                    from: 0
                    value: 0
                    to: 300
                    stepSize: 1
                    onValueChanged: {
                        roundrec.radius[0] = value
                    }
                }
                Slider {
                    from: 0
                    value: 0
                    to: 300
                    stepSize: 1
                    onValueChanged: {
                        roundrec.radius[1] = value
                    }
                }
                Slider {
                    from: 0
                    value: 0
                    to: 300
                    stepSize: 1
                    onValueChanged: {
                        roundrec.radius[2] = value
                    }
                }
                Slider {
                    from: 0
                    value: 0
                    to: 300
                    stepSize: 1
                    onValueChanged: {
                        roundrec.radius[3] = value
                    }
                }
            }

            Text {
                text: "boder"
                topPadding: 20
            }
            ColumnLayout {
                Slider {
                    from: 1
                    value: 0
                    to: 50
                    stepSize: 1
                    onValueChanged: {
                        roundrec.boderWidth = value
                    }
                }
            }
        }
    }
}
