import QtQuick 2.0

MouseArea {
    id: root
    implicitWidth: 512
    implicitHeight: 512
    property string icon

    Image {
        id: idBackgroud
        width: root.width
        height: root.height
        source: icon + "_n.png"
    }

    states: [
        State {
            name: "Focus"
            PropertyChanges {
                target: idBackgroud
                source: icon + "_d.png"
            }
        },
        State {
            name: "Pressed"
            PropertyChanges {
                target: idBackgroud
                source: icon + "_p.png"
            }
        },
        State {
            name: "Normal"
            PropertyChanges {
                target: idBackgroud
                source: icon + "_n.png"
            }
        }
    ]
    onPressed: root.state = "Pressed"

    onReleased: {
        root.focus = true
        root.state = "Focus"
    }

    onFocusChanged: {
        if (root.focus === true )
            root.state = "Focus"
        else
            root.state = "Normal"
    }
}
