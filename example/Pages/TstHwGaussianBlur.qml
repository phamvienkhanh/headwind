import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Headwind
import Qt5Compat.GraphicalEffects

Item {

    ListView {
        model: 1000
        width: 700
        height: parent.height
        delegate: compBlur
    }

    Component {
        id: compBlur

        Item {
            width: img.width
            height: img.height

            Image {
                id: img
                width: 500
                sourceSize.width: width
                source: "qrc:/example/images/testroundimage.jpg"
                fillMode: Image.PreserveAspectFit
                visible: false
                //        layer.enabled: true
            }

            FastBlur {
                id: blured
                source: img
                radius: 100
                anchors.fill: img
                visible: false
                //                layer.enabled: true
            }

            HwRectangle {
                id: maskRec

                width: img.width
                height: img.height
                visible: false
                //                layer.enabled: true
                radius: [30, 1, 30, 1]
            }

            OpacityMask {
                source: blured
                maskSource: ShaderEffectSource {
                    sourceItem: maskRec
                    hideSource: true
                }

                anchors.fill: blured
            }

            layer.enabled: true
            layer.effect: DropShadow {
                radius: 32
                samples: 20
            }
        }
    }
}
