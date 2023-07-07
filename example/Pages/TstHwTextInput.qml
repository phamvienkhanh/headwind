import QtQuick
import Headwind

Item {

    HwTextInput {
        id: textInput

        width: 200
        height: 40
        x: 100
        y: 100
        
        iconLeft: Image {
            width: 40
            sourceSize.width: 40
            source: "file:///home/noname/Downloads/icons8-youtube.svg"
        }
        iconRight: Image {
            width: textInput.input.length !== 0 ? 16 : 0
            sourceSize.width: 16
            antialiasing: true
            smooth: true
            fillMode: Image.PreserveAspectFit
            source: "file:///home/noname/Downloads/close.svg"
        }

        placeholder: "cscscsc"

        background: Rectangle {
            color: "transparent"
            border {
                width: 1
                color: "cyan"
            }
        }
    }
}
