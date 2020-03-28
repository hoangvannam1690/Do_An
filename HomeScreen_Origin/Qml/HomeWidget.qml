import QtQuick 2.12
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.4
import QtQml.Models 2.1

Item {
    id: root
    width: 1920
    height: 1096

    //======================= Xử lý Hardkeys =======================
    // Di chuyển focus đến area tương ứng
    KeyNavigation.up: appListID
    KeyNavigation.down: lvWidget
    //==============================================================

    function openApplication(url){
        parent.push(url)
    }

    ListView {
        id: lvWidget
        spacing: 10
        orientation: ListView.Horizontal
        width: 1920
        height: 570
        interactive: false

        focus: true
        keyNavigationEnabled: true
        KeyNavigation.down: appListID
        KeyNavigation.up: appListID

        // Test highlight
        highlight: Rectangle {
            color: "blue"
            opacity: 0.3
            parent: lvWidget
        }

        displaced: Transition {
            NumberAnimation { properties: "x,y"; easing.type: Easing.OutQuad }
        }

        model: DelegateModel {
            id: visualModelWidget
            model: ListModel {
                id: widgetModel
                //@disable-check M16    // Disable warning
                ListElement { type: "map" }
                //@disable-check M16
                ListElement { type: "climate" }
                //@disable-check M16
                ListElement { type: "media" }
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
                // Nhấn Left/Right để lựa chọn widget
                // Nhấn Enter để mở widget tương ứng
                Keys.onReleased: {
                    if(event.key === Qt.Key_Left || event.key === Qt.Key_Right) {
                        console.log("lvWidget Current Index: " + lvWidget.currentIndex)
                        console.log("Select Widget: " + model.type)
                    }
                    if(event.key === Qt.Key_Enter || event.key === Qt.Key_Return) {
                        console.log("Enter, open widget: " + model.type)
                        if(model.type === "map"){
                            openApplication("qrc:/App/Map/Map.qml")
                        }
                        if(model.type === "media"){
                            openApplication("qrc:/App/Media/Media.qml")
                        }
                    }
                }
                //============================================================================
                //FIXME: Chưa hiển thị được trạng thái focus khi nagivation đến widget
                // Khi nhấn Enter thì vẫn mở đúng widget


                //============================================================================

                Loader {
                    id: iconWidget
                    property int visualIndex: 0
                    width: 635; height: 570
                    anchors {
                        horizontalCenter: parent.horizontalCenter;
                        verticalCenter: parent.verticalCenter
                    }

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

                    Drag.hotSpot.x: delegateRootWidget.width/2
                    Drag.hotSpot.y: delegateRootWidget.height/2

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
                onClicked: openApplication("qrc:/App/Map/Map.qml")
                drag.target: parent
                drag.axis: Drag.XAxis
            }
        }
        Component {
            id: climateWidget
            ClimateWidget {
                drag.target: parent
                drag.axis: Drag.XAxis
            }
        }
        Component {
            id: mediaWidget
            MediaWidget{
                onClicked: openApplication("qrc:/App/Media/Media.qml")
                drag.target: parent
                drag.axis: Drag.XAxis
            }
        }
    }

    ListView {
        id: appListID
        x: 0
        y:570
        width: 1920; height: 604
        orientation: ListView.Horizontal
        interactive: false
        spacing: 5

        focus: true
        clip: true
        //=======================================================================
        // Di chuyển focus đến vị trí tương ứng
        // Ở đây thực hiện focus đến Widget area cả khi nhấn phím Up và Down
        // Cần enable key Navigation, nếu giá trị false, không thể Navigation
        keyNavigationEnabled: true
        KeyNavigation.up: lvWidget
        KeyNavigation.down: lvWidget
        //=======================================================================

        displaced: Transition {
            NumberAnimation { properties: "x,y"; easing.type: Easing.OutQuad }
        }

        model: DelegateModel {
            id: visualModel
            model: appsModel
            delegate: DropArea {
                id: delegateRoot
                width: 316; height: 604
                keys: "AppButton"

                onEntered: visualModel.items.move(drag.source.visualIndex, icon.visualIndex)

                property int visualIndex: DelegateModel.itemsIndex
                Binding { target: icon; property: "visualIndex"; value: visualIndex }

                //==============================================================================
                // Xử lý mở app khi nhấn Enter
                // Chú ý: Qt.Key_Enter: enter trên bàn phím số
                // Qt.Key_Return: Enter bàn phím thường
                Keys.onEnterPressed: {
                    console.log("Enter app selection.......From Numpad")
                    openApplication(model.url)
                }
                Keys.onReturnPressed: {
                    console.log("Enter app selection.......From Keyboard")
                    openApplication(model.url)
                }

                // Sau khi drag/drop thì trả lại focus về appListID
                // Nếu không thì sẽ không thể nhấn hardkey
                onExited: {
                    appListID.focus = true
//                    app.state = "Focus"
//                    for (var index = 0; index < visualModel.items.count;index++){
//                        if (index !== icon.visualIndex)
//                            visualModel.items.get(index).focus = false
//                        else
//                            visualModel.items.get(index).focus = true
//                    }
                }

                // -------------------- Hardkeys nagivation -----------------------
                // Xử lý focus app button được chọn khi nhấn left/right
                Keys.onReleased: {
                    app.focus = true
                    console.log("Select app: " + app.title)
                    if(event.key === Qt.Key_Left || event.key === Qt.Key_Right) {
                        app.state = "Focus"
                    }

                    for (var index = 0; index < visualModel.items.count;index++){
                        if (index !== icon.visualIndex) {
                            visualModel.items.get(index).focus = false
                        }
                        else visualModel.items.get(index).focus = true
                    }
                }
                // -------------------- Hardkeys reorder app -----------------------
                // TODO: Xử lý hardkey reorder


                //------------------------------------------------------------------

                Item {
                    id: icon
                    property int visualIndex: 0
                    width: 316; height: 604
                    anchors {
                        horizontalCenter: parent.horizontalCenter;
                        verticalCenter: parent.verticalCenter
                    }

                    AppButton{
                        id: app
                        anchors.fill: parent
                        title: model.title
                        icon: model.iconPath

                        drag.target: parent
                        drag.axis: Drag.XAxis   // Chỉ cho phép drag theo chiều ngang theo App list
                        drag.smoothed: false

                        onClicked: openApplication(model.url)
                        onReleased: {
                            app.focus = true
                            app.state = "Focus"
                            for (var index = 0; index < visualModel.items.count;index++){
                                if (index !== icon.visualIndex)
                                    visualModel.items.get(index).focus = false
                                else
                                    visualModel.items.get(index).focus = true
                            }
                        }
                    }

                    onFocusChanged: app.focus = icon.focus
                    Drag.active: app.drag.active
                    Drag.source: icon
                    Drag.keys: "AppButton"
                    Drag.hotSpot.x: delegateRoot.width*2/3
                    Drag.hotSpot.y: delegateRoot.height*2/3

                    states: [
                        State {
                            when: icon.Drag.active
                            ParentChange {
                                target: icon
                                parent: root
                            }

                            AnchorChanges {
                                target: icon
                                anchors.horizontalCenter: undefined
                                anchors.verticalCenter: undefined
                            }
                        }
                    ]
                }
            }
        }
    }

}
