
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
        ListElement {
            name: "TsHwTextInput"
            path: "Pages/TstHwTextInput.qml"
        }
        ListElement {
            name: "TsHwBox"
            path: "Pages/TstHwBox.qml"
        }
        ListElement {
            name: "HwPopover"
            path: "Pages/TstHwPopover.qml"
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
            required property string name
            required property string path
            text: name
            onClicked: function () {
                stackView.replace(path)
            }
        }
    }

    StackView {
        id: stackView
        width: parent.width - 150
        height: parent.height
        anchors.right: parent.right
        initialItem: "Pages/TstHwPopover.qml"
    }

    onActiveFocusItemChanged: {
        console.log("onActiveFocusItemChanged ", mainWindow.activeFocusItem)
    }
}
