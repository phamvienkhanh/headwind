import QtQuick
import Headwind

Item {
    property alias img: imgSource
    property alias radius: maskRec.radius

    width: imgSource.width
    height: imgSource.height

    Image {
        id: imgSource
        visible: false
        cache: false
        antialiasing: true
    }

    HwRectangle {
        id: maskRec
        anchors.fill: imgSource
        radius: [30, 0, 0, 0]
        color: "#FF0000"
        visible: false
        layer.enabled: true
    }

    ShaderEffect {
        readonly property Item iSource: imgSource
        readonly property var opacityMaskSource: maskRec
        readonly property bool opacityMaskInvert: false
        vertexShader: "qrc:/Shaders/opacitymask.vert.qsb"
        fragmentShader: "qrc:/Shaders/opacitymask.frag.qsb"
        anchors.fill: parent
    }
}
