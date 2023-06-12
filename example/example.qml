import QtQuick
import QtQuick.Controls

Window {
    width: 1000
    height: 750
    visible: true
    title: qsTr("Example")
    color: "grey"

    StackView {
        anchors.fill: parent
        initialItem: "Pages/TstHwGaussianBlur.qml"
    }
}
