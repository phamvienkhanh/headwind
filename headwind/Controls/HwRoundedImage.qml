import QtQuick
import Headwind

Item {
    property alias img: imgSource
    property alias radius: maskRec.radius

    width: imgSource.width
    height: imgSource.height

    Image {
        id: imgSource

        layer.enabled: true
        visible: false
    }

    HwRectangle {
        id: maskRec

        anchors.fill: imgSource
        radius: [0, 0, 0, 0]
        color: "#FF0000"
        visible: false
        layer.enabled: true
    }

    HwOpacityMask {
        anchors.fill: imgSource
        source: imgSource
        maskSource: maskRec
    }
}
