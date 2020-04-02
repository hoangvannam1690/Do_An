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

//    // Khu vực điều khiển
//    MouseArea {
//        id: climateControl
//        width: root.width
//        height: 526

//        Rectangle {
//            id: background
//            anchors.fill: parent
//            color: "white"
//            opacity: 0.1
//        }

//        // --------------------- Driver control -------------------
//        ClimateButton{
//            id: driverTempUp
//            width: 55
//            height: 55
//            anchors.top: parent.top
//            anchors.horizontalCenter: driverTempLabel.horizontalCenter
//            icon: "qrc:/Img/Climate/arrow.png"
//            state: "Normal"
//        }

//        Rectangle {
//            id: driverTempLabel
//            anchors.top: driverTempUp.bottom

//            width: 200
//            height: 50
//            color: "transparent"
//            Text {
//                id: driverTempLabelText
//                anchors.centerIn: parent
//                text: "Driver"
//                font.pixelSize: 34
//                color: "white"
//            }
//        }

//        ClimateButton{
//            id: driverTempDown
//            width: 55
//            height: 55
//            anchors.top: driverTempLabel.bottom
//            anchors.horizontalCenter: driverTempLabel.horizontalCenter
//            icon: "qrc:/Img/Climate/arrow.png"
//            rotation: 180
//            state: "Normal"
//        }

//        // ------------------- Passenger control ------------------
//        ClimateButton{
//            id: passengerTempUp
//            width: 55
//            height: 55
//            anchors.horizontalCenter: passengerTempLabel.horizontalCenter
//            icon: "qrc:/Img/Climate/arrow.png"
//            state: "Normal"
//        }
//        Rectangle {
//            id: passengerTempLabel
//            anchors.left: driverTempLabel.right
//            anchors.rightMargin: 80
//            anchors.top: passengerTempUp.bottom

//            width: 200
//            height: 50
//            color: "transparent"
//            Text {
//                id: passengerTempLabelText
//                anchors.centerIn: parent
//                text: "Passenger"
//                font.pixelSize: 34
//                color: "white"
//            }
//        }
//        ClimateButton{
//            id: passengerTempDown
//            width: 55
//            height: 55
//            anchors.horizontalCenter: passengerTempLabel.horizontalCenter
//            anchors.top: passengerTempLabel.bottom
//            icon: "qrc:/Img/Climate/arrow.png"
//            rotation: 180
//            state: "Normal"
//        }

//        // ----------------------- Fan control --------------------

//    }



    //==============
    //------------------------------
    Text {
        id: temp1
        x: 20
        y: 20
        text: "Temperature driver: "
        color: "white"
        horizontalAlignment: Text.AlignHCenter
    }

    SpinBox {
        id: driverTemp
        anchors.left: passengerTemp.left
        anchors.verticalCenter: temp1.verticalCenter
        from: 165
        to: 315
        stepSize: 5

        property int decimals: 1
        property real realValue: value / 10

        validator: DoubleValidator {
            bottom: Math.min(driverTemp.from, driverTemp.to)
            top:  Math.max(driverTemp.from, driverTemp.to)
        }

        textFromValue: function(value, locale) {
            return Number(value / 10).toLocaleString(locale, 'f', driverTemp.decimals)
        }

        valueFromText: function(text, locale) {
            return Number.fromLocaleString(locale, text)
        }

        onRealValueChanged: saveData()
    }

    Text {
        id: temp2
        anchors.top: temp1.bottom
        anchors.topMargin: 30
        anchors.left: temp1.left
        text: "Temperature passenger: "
        color: "white"
        horizontalAlignment: Text.AlignHCenter
    }
    SpinBox {
        id: passengerTemp
        anchors.left: temp2.right
        anchors.leftMargin: 20
        anchors.verticalCenter: temp2.verticalCenter
        from: 165
        to: 315
        stepSize: 5

        property int decimals: 1
        property real realValue: value / 10

        validator: DoubleValidator {
            bottom: Math.min(driverTemp.from, driverTemp.to)
            top:  Math.max(driverTemp.from, driverTemp.to)
        }

        textFromValue: function(value, locale) {
            return Number(value / 10).toLocaleString(locale, 'f', driverTemp.decimals)
        }

        valueFromText: function(text, locale) {
            return Number.fromLocaleString(locale, text)
        }

        onRealValueChanged: saveData()
    }
    Text {
        id: fan
        anchors.top: temp2.bottom
        anchors.topMargin: 30
        anchors.left: temp2.left
        text: "Fan: "
        color: "white"
        horizontalAlignment: Text.AlignHCenter
    }

    Row {
        id: r1
        anchors.right: passengerTemp.right
        anchors.verticalCenter: fan.verticalCenter
        Slider {
            id: fanLevel
            from : 1
            to: 10
            stepSize: 1
            value: 0
//            onValueChanged: saveData()
            onValueChanged: climateModel.fan_level = value
        }
        Text {
            id: valueSlider
            text: fanLevel.value
            color: "white"
            horizontalAlignment: Text.AlignHCenter
        }
    }
    Text {
        id: driver_wind_mode_txt
        anchors.top: fan.bottom
        anchors.topMargin: 30
        anchors.left: temp1.left
        text: "Driver wind direction"
        color: "white"
        horizontalAlignment: Text.AlignHCenter
    }

    ComboBox {
        id: driver_wind_mode
        anchors.verticalCenter: driver_wind_mode_txt.verticalCenter
        anchors.left: passengerTemp.left
        textRole: "key"
        model: ListModel {
            ListElement {
                key: "on face"
                value: 0
            }
            ListElement {
                key: "on foot"
                value: 1
            }
            ListElement {
                key: "on face and foot"
                value: 2
            }
        }
//        onCurrentIndexChanged: saveData()
        onCurrentIndexChanged: climateModel.driver_wind_mode = driver_wind_mode.currentIndex
    }
    Text {
        id: passenger_wind_mode_txt
        anchors.top: driver_wind_mode_txt.bottom
        anchors.topMargin: 30
        anchors.left: temp1.left
        text: "Passenger wind direction"
        color: "white"
        horizontalAlignment: Text.AlignHCenter
    }

    ComboBox {
        id: passenger_wind_mode
        anchors.verticalCenter: passenger_wind_mode_txt.verticalCenter
        anchors.left: passengerTemp.left
        textRole: "key"
        model: ListModel {
            ListElement {
                key: "on face"
                value: 0
            }
            ListElement {
                key: "on foot"
                value: 1
            }
            ListElement {
                key: "on face and foot"
                value: 2
            }
        }
        onCurrentIndexChanged:saveData()
    }
    Text {
        id: auto_mode_txt
        anchors.left: temp1.left
        anchors.top: passenger_wind_mode_txt.bottom
        anchors.topMargin: 30
        text: "AUTO mode: "
        color: "white"
        horizontalAlignment: Text.AlignHCenter
    }

    ComboBox {
        id: auto_mode
        anchors.left: passengerTemp.left
        anchors.verticalCenter: auto_mode_txt.verticalCenter
        textRole: "key"
        model: ListModel {
            ListElement {
                key: "ON"
                value: 0
            }
            ListElement {
                key: "OFF"
                value: 1
            }
        }
        onCurrentIndexChanged: saveData()
    }
    Text {
        id: sync_mode_txt
        anchors.left: temp1.left
        anchors.top: auto_mode_txt.bottom
        anchors.topMargin: 30
        text: "SYNC mode: "
        color: "white"
        horizontalAlignment: Text.AlignHCenter
    }

    ComboBox {
        id: sync_mode
        anchors.left: passengerTemp.left
        anchors.verticalCenter: sync_mode_txt.verticalCenter
        textRole: "key"
        model: ListModel {
            ListElement {
                key: "ON"
                value: 0
            }
            ListElement {
                key: "OFF"
                value: 1
            }
        }
        onCurrentIndexChanged: saveData()
    }

    Component.onCompleted: {
//        saveData()

    }

}
