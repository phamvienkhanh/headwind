import QtQuick
import QtQuick.Layouts
import Headwind

Item {

    Image {
        id: img
        x: 50
        y: 50
        width: 300
        sourceSize.width: width
        source: "qrc:/example/images/testroundimage.jpg"
        fillMode: Image.PreserveAspectFit
        visible: false
        layer.enabled: true
    }

    HwGaussianBlur {
        id: blured
        source: img
        radius: 8
        deviation: 4
        anchors.fill: img
        visible: false
        layer.enabled: true
    }

    HwRectangle {
        id: maskRec

        width: 300
        height: 300
        visible: false
        layer.enabled: true
        radius: [30, 1, 30, 1]
    }

    HwOpacityMask {
        source: blured
        maskSource: maskRec
        anchors.fill: blured
    }
}
