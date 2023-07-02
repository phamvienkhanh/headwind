import QtQuick

HwBaseItem {

    content.spacing: 10
    content.padding: 10
    
    slot1: Rectangle {
        width: 30
        height: 30
        color: "black"
    }
    slot2: TextInput {
        width: centerColumn.width
        height: 30
    }
    slot4: Rectangle {
        width: 30
        height: 30
        color: "black"
    }
}

