import QtQuick

ShaderEffect {
    property var source: null
    property var maskSource: null

    layer.enabled: true
    fragmentShader: "qrc:/Headwind/Shaders/opacitymask.frag.qsb"
}
