import QtQuick
import QtQuick.Controls
import QtQuick.Window

import HiDash

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Row {
        Button {
            text: "load"
            onClicked: {
                loader.sourceComponent = comp
            }
        }
        Button {
            text: "unload"
            onClicked: {
                loader.sourceComponent = undefined
            }
        }
    }

    Loader {
        id: loader
        y: 50
    }

    Component {
        id: comp

        Rectangle {
            id: rec
            color: "red"
            width: 100
            height: 100

            property var debounce:  HiDash.debounce(rec, function () {
//                                        console.log("debounce call")
                                    }, 1000, {leading: true, trailing: false, maxWait: 300})

            Component.onCompleted: {
            }

            Component.onDestruction: {
                console.log("Component.onDestruction")
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    debounce()
//                    let timeId = HiDash.delay(3000, function () {console.log("delay call")})
                }
            }
        }
    }

}
