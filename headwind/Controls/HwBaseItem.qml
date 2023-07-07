import QtQuick

Item {
    id: rootItem

    signal clicked

    property alias content: content    
    property alias hovered: hoveredHandler.hovered
    property alias pressed: hitZone.pressed

    property size autoSize: Qt.size(0, 0)
    property real columnSpacing: 5

    property Item slot1
    property Item slot2
    property Item slot3
    property Item slot4   

    property Item background

    readonly property Item middleColumn: Column {
        anchors.verticalCenter: parent.verticalCenter
        spacing: rootItem.columnSpacing
        width: {
            const s1w = rootItem.slot1?.width ?? 0
            const s2w = rootItem.slot4?.width ?? 0
            let offset = content.leftPadding + content.rightPadding + (rootItem.slot1?.width ?? 0) + (rootItem.slot4?.width ?? 0)
            offset = offset + (s1w && true) * content.spacing
            offset = offset + (s2w && true) * content.spacing

            return content.width - offset
        }
        
        children: [
            rootItem.slot2, rootItem.slot3
        ]
    }

    Component.onCompleted: {
        rootItem.autoSize = Qt.binding(function () {
            const s1Size = Qt.size(rootItem.slot1?.width ?? 0, rootItem.slot1?.height ?? 0)
            const s2Size = Qt.size(rootItem.slot2?.width ?? 0, rootItem.slot2?.height ?? 0)
            const s3Size = Qt.size(rootItem.slot3?.width ?? 0, rootItem.slot3?.height ?? 0)
            const s4Size = Qt.size(rootItem.slot4?.width ?? 0, rootItem.slot4?.height ?? 0)

            const colW = Math.max(s2Size.width, s3Size.width)
            const colH = s2Size.height + s3Size.height + (s2Size.height && s3Size.height && true) * middleColumn.spacing

            let w = s1Size.width + colW + s4Size.width + content.leftPadding + content.rightPadding
            const offset = ((s1Size.width && colW && true) * content.spacing + (s4Size.width && colW && true) * content.spacing) 
                            || s1Size.width && s4Size.width && true * content.spacing
            w = w + offset

            const h = Math.max(colH, s1Size.height, s4Size.height) + content.topPadding + content.bottomPadding

            return Qt.size(w, h)
        })

        rootItem.slot1 && (rootItem.slot1.anchors.verticalCenter = content.verticalCenter)
        rootItem.slot4 && (rootItem.slot4.anchors.verticalCenter = content.verticalCenter)

        if(rootItem.background) {
            rootItem.background.width = Qt.binding(function () {return rootItem.width})
            rootItem.background.height = Qt.binding(function () {return rootItem.height})
            rootItem.background.z = -1
            rootItem.children.push(rootItem.background)
        }
    }

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

    HwRipple {
        id: rippleAnim
        maxSize: parent.width*2
    }

    Row {
        id: content
        
        anchors.fill: parent

        children: [
            rootItem.slot1,
            rootItem.middleColumn,
            rootItem.slot4
        ]
    }
}
