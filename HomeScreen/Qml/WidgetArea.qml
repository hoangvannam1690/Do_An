import QtQuick 2.12
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.4
import QtQml.Models 2.1

ListView {
    id: lvWidget
//        spacing: 10
//        orientation: ListView.Horizontal
//        width: 1920
//        height: 570
    interactive: false
    focus: true
    displaced: Transition {
        NumberAnimation { properties: "x,y"; easing.type: Easing.OutQuad }
    }

    // Nhấn Up/Down sẽ chuyển focus qua lại giữa Widget và applist area
    keyNavigationEnabled: true
    KeyNavigation.down: applicationMenu
    KeyNavigation.up: applicationMenu

    model: DelegateModel {
        id: visualModelWidget
        model: ListModel {
            id: widgetModel
            ListElement { type: "map" }         //@disable-check M16    // Disable warning
            ListElement { type: "climate" }     //@disable-check M16
            ListElement { type: "media" }       //@disable-check M16
        }

        delegate: DropArea {
            id: delegateRootWidget
            width: 635; height: 570
            keys: ["widget"]

            onEntered: {
                visualModelWidget.items.move(drag.source.visualIndex, iconWidget.visualIndex)
                iconWidget.item.enabled = false
            }
            property int visualIndex: DelegateModel.itemsIndex
            Binding { target: iconWidget; property: "visualIndex"; value: visualIndex }
            onExited: iconWidget.item.enabled = true
            onDropped: {
                console.log(drop.source.visualIndex)
            }

            // -------------------- Xử lý KeyNavigation widget ---------------------------
            // Nhấn Left/Right để lựa chọn focus widget
            // Nhấn Enter để mở widget tương ứng
            Keys.onPressed: {
                // console.log("Nhấn: bỏ focus trước đó" )
                iconWidget.item.focus = false
                if(event.key === Qt.Key_Enter || event.key === Qt.Key_Return) {
                    console.log("Enter, open widget: " + model.type)
                    if(model.type === "map") {
                        homeScreen.openApplication("qrc:/App/Map/Map.qml")
                    }
                    if(model.type === "climate") {
                        homeScreen.openApplication("qrc:/App/Climate/Climate.qml")
                    }
                    if(model.type === "media"){
                        homeScreen.openApplication("qrc:/App/Media/Media.qml")
                    }
                }

                // Reorder hardkey: Nhấn giữ Shift + Left/Right để sắp xếp widget
                // Tham khảo KeyEvent.modifiers https://doc.qt.io/qt-5/qml-qtquick-keyevent.html#modifiers-prop
                if((event.modifiers & Qt.ShiftModifier) && (event.key === Qt.Key_Left)) {
                    console.log("Shift + move to left" )
                    widgetModel.move(visualIndex,visualIndex -1,1)

                    event.accepted = true
                }
                if((event.modifiers & Qt.ShiftModifier) && (event.key === Qt.Key_Right)) {
                    console.log("Shift + move to right" )
                    widgetModel.move(visualIndex,visualIndex +1,1)
                    event.accepted = true
                }
            }

            Keys.onReleased: {
                //  console.log("Nhả phím: focus button mới" )
                iconWidget.item.focus = true
                iconWidget.item.state = "Focus"

                //  if(event.key === Qt.Key_Left || event.key === Qt.Key_Right) {}
                console.log("Select Widget: " + model.type)
            }

            //============================================================================
            Loader {
                id: iconWidget
                property int visualIndex: 0
                width: 635; height: 570
                anchors {
                    horizontalCenter: parent.horizontalCenter;
                    verticalCenter: parent.verticalCenter
                }
//                    state: "Pressed"

                sourceComponent: {
                    switch(model.type) {
                    case "map": return mapWidget
                    case "climate": return climateWidget
                    case "media": return mediaWidget
                    }
                }

                Drag.active: iconWidget.item.drag.active
                Drag.keys: "widget"
                Drag.source: iconWidget

                Drag.hotSpot.x: delegateRootWidget.width*2/3
                Drag.hotSpot.y: delegateRootWidget.height*2/3

                states: [
                    State {
                        when: iconWidget.Drag.active
                        ParentChange {
                            target: iconWidget
                            parent: root
                        }
                        AnchorChanges {
                            target: iconWidget
                            anchors.horizontalCenter: undefined
                            anchors.verticalCenter: undefined
                        }
                    }
                ]
            }
        }
    }

    Component {
        id: mapWidget
        MapWidget{
            onClicked: homeScreen.openApplication("qrc:/App/Map/Map.qml")
            drag.target: parent
            drag.axis: Drag.XAxis
            state: ""

            onFocusChanged: {
                if (focus === true )
                    state = "Focus"
                else
                    state = "Normal"
            }
        }
    }
    Component {
        id: climateWidget
        ClimateWidget {
            onClicked: homeScreen.openApplication("qrc:/App/Climate/Climate.qml")
            drag.target: parent
            drag.axis: Drag.XAxis
            state: ""
            onFocusChanged: {
                if (focus === true )
                    state = "Focus"
                else
                    state = "Normal"
            }
        }
    }
    Component {
        id: mediaWidget
        MediaWidget{
            onClicked: homeScreen.openApplication("qrc:/App/Media/Media.qml")
            drag.target: parent
            drag.axis: Drag.XAxis
            state: ""
            onFocusChanged: {
                if (focus === true )
                    state = "Focus"
                else
                    state = "Normal"
            }
        }
    }
}


