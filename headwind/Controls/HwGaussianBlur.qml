import QtQuick

Item {
    id: rootItem

    property alias source: shaderItem.src
    property alias radius: shaderItem.radius
    property alias deviation: shaderItem.deviation

    ShaderEffect {
        id: shaderItem

        property var src
        property int radius: 8
        property real deviation: 4
        property var pixelStep: Qt.vector2d(1 / src.width, 1 / src.height)

        anchors.fill: parent
        fragmentShader: "qrc:/Headwind/Shaders/gaussianblur.frag.qsb"
    }
}
