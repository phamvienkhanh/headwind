import QtQuick

Item {
    id: rootItem

    signal clicked

    property alias content: content    
    property alias centerColumn: centerColumn
    property alias background: loaderBackground.sourceComponent
    property alias hovered: hoveredHandler.hovered
    property alias pressed: hitZone.pressed

    property alias slot1: loaderSlot1.sourceComponent
    property alias slot2: loaderSlot2.sourceComponent
    property alias slot3: loaderSlot3.sourceComponent
    property alias slot4: loaderSlot4.sourceComponent

    property size autoSize: Qt.size(0, 0)

    Component.onCompleted: {
        rootItem.autoSize = Qt.binding(function () {
            const colW = Math.max(loaderSlot2.width, loaderSlot3.width)
            const colH = loaderSlot2.height + loaderSlot3.height 
                        + (loaderSlot2.height && loaderSlot3.height && true) * centerColumn.spacing

            let w = loaderSlot1.width + colW + loaderSlot4.width + content.leftPadding + content.rightPadding
            const offset = ((loaderSlot1.width && colW && true) * content.spacing + (loaderSlot4.width && colW && true) * content.spacing) 
                            || loaderSlot1.width && loaderSlot4.width && true * content.spacing
            w = w + offset

            const h = Math.max(colH, loaderSlot1.height, loaderSlot4.height) + content.topPadding + content.bottomPadding

            return Qt.size(w, h)
        })
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

        Loader {
            id: loaderSlot1
            anchors.verticalCenter: parent.verticalCenter
        }

        Column {
            id: centerColumn

            anchors.verticalCenter: parent.verticalCenter
            width: {                
                let offset = content.leftPadding + content.rightPadding + loaderSlot1.width + loaderSlot4.width
                offset = offset + (loaderSlot1.width && true) * content.spacing
                offset = offset + (loaderSlot4.width && true) * content.spacing

                return content.width - offset
            }

            Loader {
                id: loaderSlot2
            }

            Loader {
                id: loaderSlot3
            }
        }

        Loader {
            id: loaderSlot4
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
