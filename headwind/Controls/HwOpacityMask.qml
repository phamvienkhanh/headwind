import QtQuick

Item {
    id: rootItem

    property variant source
    property variant maskSource

    ShaderEffect {
        id: shaderItem
        property variant source: rootItem.source
        property variant maskSource: rootItem.maskSource

        anchors.fill: parent

        fragmentShader: "qrc:/Headwind/Shaders/opacitymask.frag.qsb"
    }
}
