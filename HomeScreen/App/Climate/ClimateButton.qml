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
//        source: icon + "_n.png"
        source: icon

        Rectangle{
            id: mFocus
            anchors.fill: parent
            color: "cyan"
            opacity: 0
        }
    }

    states: [
        State {
            name: "Focus"
            PropertyChanges {
                target: mFocus
//                source: icon + "_f.png"
                opacity: 0.1

            }
        },
        State {
            name: "Pressed"
            PropertyChanges {
                target: mFocus
//                source: icon + "_p.png"
                opacity: 0.5
            }
        },
        State {
            name: "Normal"
            PropertyChanges {
                target: mFocus
//                source: icon + "_n.png"
                opacity: 0
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
