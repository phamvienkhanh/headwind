import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Dialogs
import Headwind

Item {
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
                text: "Radius"
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
                text: "Boder"
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

            Text {
                text: "Color"
                topPadding: 20
            }
            RowLayout {
                Button {
                    text: "boder"
                    onClicked: {
                        colorDialog.open()
                        let func = function () {
                            console.log(colorDialog.selectedColor)
                            roundrec.boderColor = colorDialog.selectedColor
                            colorDialog.accepted.disconnect(func)
                        }
                        colorDialog.accepted.connect(func)
                    }
                }
                Button {
                    text: "background"
                    onClicked: {
                        colorDialog.open()
                        let func = function () {
                            roundrec.color = colorDialog.selectedColor
                            colorDialog.accepted.disconnect(func)
                        }
                        colorDialog.accepted.connect(func)
                    }
                }
            }
        }
    }

    ColorDialog {
        id: colorDialog
    }
}
