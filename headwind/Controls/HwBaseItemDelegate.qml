import QtQuick
import QtQuick.Layouts

Item {
    id: rootItem

    property int verticalPadding: 10
    property int horizontalPadding: 10

    property alias slot1: loaderSlot1.sourceComponent
    property alias slot2: loaderSlot2.sourceComponent
    property alias slot3: loaderSlot3.sourceComponent
    property alias slot4: loaderSlot4.sourceComponent

    property alias background: loaderBackground.sourceComponent

    implicitWidth: mainRow.width + 2 * horizontalPadding
    implicitHeight: mainRow.height + 2 * verticalPadding

    Loader {
        id: loaderBackground
        anchors.fill: parent
    }

    RowLayout {
        id: mainRow

        anchors.centerIn: parent
        width: parent.width - 2 * horizontalPadding

        //        height: parent.height - 2 * verticalPadding
        Loader {
            id: loaderSlot1
        }

        ColumnLayout {
            Layout.fillWidth: true

            Loader {
                id: loaderSlot2
                //                Layout.fillWidth: true
            }
            Loader {
                id: loaderSlot3
                //                Layout.fillWidth: true
            }
        }

        Loader {
            id: loaderSlot4
        }
    }
}
