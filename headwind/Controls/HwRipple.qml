import QtQuick

Rectangle {
    id: rootItem   

    property point originPoint: Qt.point(0, 0)
    property int maxSize: 100

    color: "black"
    radius: width/2
    x: originPoint.x - width/2
    y: originPoint.y - height/2

    ParallelAnimation {
        id: anim

        NumberAnimation {                    
            target: rootItem
            properties: "width,height"
            from: 0
            to: maxSize
            duration: 600
            easing {
                type: Easing.OutQuad
            }
        }
        NumberAnimation {                    
            target: rootItem
            properties: "opacity"
            from: 0.3
            to: 0
            duration: 600
            easing {
                type: Easing.OutQuad
            }
        }
    }

    function start(origin: point) {
        rootItem.originPoint = origin
        anim.start()
    }
}
