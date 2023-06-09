import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material
import Headwind

Window {
    width: 1000
    height: 750
    visible: true
    title: qsTr("Example")
    color: "grey"

    Item {
        anchors.fill: parent

        HwRectangle {
            id: roundrec
            x: 100
            y: 100
            width: 300
            height: 300
            radius: [0, 0, 0, 0]
            color: "cyan"
            boderColor: "red"
            boderWidth: 0
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
                    from: 0
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
