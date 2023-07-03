import QtQuick

Item {
    id: rootItem

    signal clicked

    property alias content: content    
    property alias hovered: hoveredHandler.hovered
    property alias pressed: hitZone.pressed

    property size autoSize: Qt.size(0, 0)

    property Item slot1
    property Item slot2
    property Item slot3
    property Item slot4   

    property Item background

    property alias middleColumn: middleColumn
    property Item _middleColumn: Column {
        id: middleColumn
        anchors.verticalCenter: parent.verticalCenter
        width: {                
            let offset = content.leftPadding + content.rightPadding + slot1.width + slot4.width
            offset = offset + (slot1.width && true) * content.spacing
            offset = offset + (slot4.width && true) * content.spacing

            return content.width - offset
        }

        children: [
            slot2, slot3
        ]
    }

    Component.onCompleted: {
        rootItem.autoSize = Qt.binding(function () {
            const colW = Math.max(slot2.width, slot3.width)
            const colH = slot2.height + slot3.height 
                        + (slot2.height && slot3.height && true) * middleColumn.spacing

            let w = slot1.width + colW + slot4.width + content.leftPadding + content.rightPadding
            const offset = ((slot1.width && colW && true) * content.spacing + (slot4.width && colW && true) * content.spacing) 
                            || slot1.width && slot4.width && true * content.spacing
            w = w + offset

            const h = Math.max(colH, slot1.height, slot4.height) + content.topPadding + content.bottomPadding

            return Qt.size(w, h)
        })

        if(slot1) {
            slot1.anchors.verticalCenter = content.verticalCenter
        }
        if(slot4) {
            slot4.anchors.verticalCenter = content.verticalCenter
        }
    }

    clip: true
    
    MouseArea {
        id: hitZone
        anchors.fill: parent        
        onClicked: function (mouse) {
            rootItem.clicked()
            rippleAnim.start(Qt.point(mouse.x, mouse.y))
        }
    }

    HoverHandler {
        id: hoveredHandler
    }

    Loader {
        id: loaderBackground
        anchors.fill: parent
    }

    HwRipple {
        id: rippleAnim
        maxSize: parent.width*2
    }

    Row {
        id: content
        
        anchors.fill: parent

        children: [
            slot1,
            middleColumn,
            slot4
        ]        
    }
}
