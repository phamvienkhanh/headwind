import QtQuick

Item {
    id: rootItem

    default property alias content: container.children
    
    property int padding : 0
    property int leftPadding : 0
    property int rightPadding : 0
    property int topPadding : 0
    property int bottomPadding : 0
    property Item background

    Component.onCompleted: {
        if(rootItem.background) {
            rootItem.background.width = rootItem.width
            rootItem.background.height = rootItem.height
            rootItem.background.z = -1
            rootItem.children.push(rootItem.background)
        }
    }
    
    Item {
        id: container        
        anchors.fill: parent
        anchors.leftMargin: Math.max(padding,leftPadding)
        anchors.rightMargin: Math.max(padding,rightPadding)
        anchors.topMargin: Math.max(padding,topPadding)
        anchors.bottomMargin: Math.max(padding,bottomPadding)
    }
}