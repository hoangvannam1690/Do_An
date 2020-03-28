import QtQuick 2.11
import QtQuick.Controls 2.4
import QtMultimedia 5.12

Item {
    id: root
    width: 1920
    height: 1200-70

    focus: true

    Rectangle {
        id: rectAppTittle
        width: parent.width
        height: 100
        color: "transparent"
        Text {
            id: appTitle
            anchors.centerIn: parent
            text: "Phone"
            color: "white"
            font.pixelSize: 44
        }
    }

    Rectangle{
        id: numberDial
        width: 1920 - 1420
        height: 120
        anchors.top: rectAppTittle.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white"
        opacity: 0.2
    }

    Grid {
        anchors.top: numberDial.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter:  parent.horizontalCenter

        columns: 3
        columnSpacing: 60
        rowSpacing: 16

        Button { text: "1" }
        Button { text: "2" }
        Button { text: "3" }
        Button { text: "4" }
        Button { text: "5" }
        Button { text: "6" }
        Button { text: "7" }
        Button { text: "8" }
        Button { text: "9" }
        Button { text: "Call" }
        Button { text: "0" }
        Button { text: "Reject" }
    }
}

