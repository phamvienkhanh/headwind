import QtQuick

HwBaseItem {
    id: rootItem

    property alias iconLeft: rootItem.slot1
    property alias iconRight: rootItem.slot4

    property string placeholder: ""
    property TextInput input: TextInput {       
        width: rootItem.middleColumn.width
        height: 30
        verticalAlignment: TextInput.AlignVCenter
        clip: true

        Text {
            id: txtPlaceHolder
            anchors.fill: input
            opacity: input.text ? 0 : 0.3
            text: rootItem.placeholder
            verticalAlignment: input.verticalAlignment
        }
    }

    content.spacing: 10
    content.padding: 10

    Component.onCompleted: {
        Qt.callLater(function () {
            rootItem.slot2.forceActiveFocus()
        })
    }
    
    slot2: input
}

