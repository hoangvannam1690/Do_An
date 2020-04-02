import QtQuick 2.0
import QtQuick.Controls 2.4

Item {
    id: root
    width: 1920
    height: 570 + 526

    // Khu vực hiển thị
    ClimateInfo {
        id: mClimate
        anchors.horizontalCenter: root.horizontalCenter
//        y: 63.5
//        scale: 1.2
    }

    // Khu vực điều khiển
    MouseArea {
        id: climateControl
//        anchors.top: mClimate.bottom
        width: root.width
        height: 526

        Rectangle {
            id: background
            anchors.fill: parent
            color: "white"
            opacity: 0.1
        }

        ClimateButton{
            id: driverTempUp
            width: 104
            height: 56
            icon: "qrc:/Img/Climate/ico_arrow_u"
            state: ""
        }

        Rectangle {
            id: driverTempLabel
            anchors.horizontalCenter: driverTempUp.horizontalCenter

            width: 100; height: 40
            color: "transparent"

            Text {
                id: driverTempLabelText
                text: "Driver Temperature"
            }
        }




        ClimateButton{
            id: driverTempDown
            width: 104
            height: 56
            anchors.horizontalCenter: driverTempUp.horizontalCenter
            anchors.top: driverTempLabel.bottom
            icon: "qrc:/Img/Climate/ico_arrow_u"
            state: ""
        }

    }

}
