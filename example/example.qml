import QtQuick
import QtQuick.Controls

Window {
    id: mainWindow

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

    color: "grey"
    height: 750
    title: qsTr("Example")
    visible: true
    width: 1000

    ListView {
        height: parent.height
        model: mainWindow.pages
        spacing: 10
        width: 150

        delegate: Button {
            required property string name
            required property string path

            height: 30
            text: name
            width: 150

            onClicked: function () {
                stackView.replace(path);
            }
        }
    }

    StackView {
        id: stackView

        anchors.right: parent.right
        height: parent.height
        initialItem: "Pages/TstHwRoundedImage.qml"
        width: parent.width - 150
    }
}
