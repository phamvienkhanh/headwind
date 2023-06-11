import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material
import Headwind

Item {
    HwRoundedImage {
        id: roundedImg
        x: 50
        y: 50
        img.width: 500
        img.sourceSize.width: width
        img.source: "qrc:/example/images/testroundimage.jpg"
        img.fillMode: Image.PreserveAspectFit
        radius: [0, 0, 0, 0]
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
                    roundedImg.radius[0] = value
                }
            }
            Slider {
                from: 0
                value: 0
                to: 300
                stepSize: 1
                onValueChanged: {
                    roundedImg.radius[1] = value
                }
            }
            Slider {
                from: 0
                value: 0
                to: 300
                stepSize: 1
                onValueChanged: {
                    roundedImg.radius[2] = value
                }
            }
            Slider {
                from: 0
                value: 0
                to: 300
                stepSize: 1
                onValueChanged: {
                    roundedImg.radius[3] = value
                }
            }
        }
    }
}
