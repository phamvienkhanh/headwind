import QtQuick
import Headwind

Item {
    HwBaseItemDelegate {
        x: 100
        y: 100

        width: 400
        height: 40

        slot1: Rectangle {
            width: 40
            height: 40
        }
        slot2: Rectangle {
            width: 200
            height: 20
        }
        slot3: Rectangle {
            width: 100
            height: 20
        }
        slot4: Rectangle {
            width: 40
            height: 40
        }

        background: Rectangle {
            color: "black"
        }
    }
}
