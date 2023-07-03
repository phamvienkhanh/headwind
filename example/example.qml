import QtQuick
import QtQuick.Controls

Window {
    id: mainWindow
    width: 1000
    height: 750
    visible: true
    title: qsTr("Example")
    color: "grey"

    property ListModel pages: ListModel {
        ListElement {
            name: "HwRectangle"
            path: "Pages/TstHwRectangle.qml" 
        }
        ListElement {
            name: "HwRoundedImage"
            path: "Pages/TstHwRoundedImage.qml"
        }
        ListElement {
            name: "HwBaseItem"
            path: "Pages/TstHwBaseItem.qml"
        }
    }

    ListView {
        width: 150
        height: parent.height
        spacing: 10
        model: mainWindow.pages
        delegate: Button {
            width: 150
            height: 30
            text: model.name
            onClicked: function () {
                stackView.replace(model.path)
            }
        }
    }

    StackView {
        id: stackView
        width: parent.width - 150
        height: parent.height
        anchors.right: parent.right
        initialItem: "Pages/TstHwBaseItem.qml"
    }
}
