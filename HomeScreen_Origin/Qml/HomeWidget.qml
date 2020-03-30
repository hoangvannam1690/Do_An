import QtQuick 2.12
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.4
import QtQml.Models 2.1

Item {
    id: root
    width: 1920
    height: 1096

    //======================= Xử lý Hardkeys =======================
    // Nhấn enter sẽ hiện focus ở widget
    Keys.onPressed: {
        if(event.key === Qt.Key_Enter ||event.key === Qt.Key_Return) {
            if(root.focus == true) lvWidget.focus = true
        }
    }

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
        displaced: Transition {
            NumberAnimation { properties: "x,y"; easing.type: Easing.OutQuad }
        }        

        // Nhấn Up/Down sẽ chuyển focus qua lại giữa Widget và app list area
        keyNavigationEnabled: true
        KeyNavigation.down: appListID
        KeyNavigation.up: appListID

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
                    if(event.key === Qt.Key_Enter || event.key === Qt.Key_Return) {
                        console.log("Enter, open widget: " + model.type)
                        if(model.type === "map") {
                            openApplication("qrc:/App/Map/Map.qml")
                        }
                        if(model.type === "media"){
                            openApplication("qrc:/App/Media/Media.qml")
                        }
                    }
                     // console.log("Nhấn: bỏ focus trước đó" )
                        iconWidget.item.focus = false
                }

                Keys.onReleased: {
                    //  console.log("Nhả phím: focus button mới" )
                    iconWidget.item.focus = true
                    iconWidget.item.state = "Focus"

                    //  if(event.key === Qt.Key_Left || event.key === Qt.Key_Right) {}
                    console.log("Select Widget: " + model.type)
                }


                //============================================================================
                // FIXME: Reorder hardkey
                // Tham khảo KeyEvent.modifiers https://doc.qt.io/qt-5/qml-qtquick-keyevent.html#modifiers-prop
//                Keys.onPressed: {
//                    if((event.key === Qt.Key_Enter) && (event.modifiers & Qt.ShiftModifier)) {
//                        console.log("Enter & move: " )
//                    }
//                }

                //============================================================================
                Loader {
                    id: iconWidget
                    property int visualIndex: 0
                    width: 635; height: 570
                    anchors {
                        horizontalCenter: parent.horizontalCenter;
                        verticalCenter: parent.verticalCenter
                    }
                    state: "Pressed"

                    sourceComponent: {
                        switch(model.type) {
                        case "map": return mapWidget //ADD
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
                onClicked: openApplication("qrc:/App/Map/Map.qml")
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
                onClicked: openApplication("qrc:/App/Media/Media.qml")
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

    ListView {
        id: appListID
        x: 0
        y:570
        width: 1920; height: 604
        orientation: ListView.Horizontal
        interactive: true
        spacing: 5
        clip: true

        // Cần enable key Navigation, nếu giá trị false, không thể Navigation
        keyNavigationEnabled: true

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
                // Sau khi drag/drop thì trả lại focus về appListID
                // Nếu không thì sẽ không thể nhấn hardkey
                onExited: {
                    appListID.focus = true
                }

                // -------------------- Hardkeys nagivation ------------------------------------
                // TODO: Xử lý hardkey reorder      FIXME: Reorder applist




                //------------------------------------------------------------------------------

//                onFocusChanged: {
//                    if(appListID.focus === false)
//                            app.focus = false
//                }

                // Khi nhấn Up/Down thì chuyển focus lên Widget, do đó bỏ focus tại app list
                Keys.onPressed: {
                    if (event.key === Qt.Key_Up || event.key === Qt.Key_Down) {
                        app.focus = false
                    } else
                        app.focus = true

                    // Xử lý mở app khi nhấn Enter
                    // Chú ý: Qt.Key_Enter: enter trên bàn phím số (numpad)
                    // Qt.Key_Return: Enter bàn phím thường
                    if(event.key === Qt.Key_Enter || event.key === Qt.Key_Return) {
                        openApplication(model.url)
                        console.log("Open " + app.title)
                    }
                }

                Keys.onReleased: {
                    app.focus = true
                    console.log("Select app: " + app.title)
                }

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

                    onFocusChanged: app.focus = icon.focus // appListID.focus   //icon.focus
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

        //Scroll list app: chỉ hiển thị khi có nhiều hơn 6 app
        ScrollBar.horizontal:  ScrollBar {
            id: scrollview
            parent: appListID.parent
            anchors.top: appListID.top
            anchors.left: appListID.left
            anchors.right: appListID.right
            visible: visualModel.items.count > 6 ? true : false
        }
    }
}
