import QtQuick 2.12
import QtQml.Models 2.1
import QtQuick.Controls 2.4


ListView {
    id: appListMenu
//        width: 1920; height: 526
    orientation: ListView.Horizontal
    interactive: false
    spacing: 5
    clip: true
    highlightMoveDuration: 100

    // Cần enable key Navigation, nếu giá trị false, không thể Navigation
    keyNavigationEnabled: true    

    model: DelegateModel {
        id: visualModel
        model: appsModel
        delegate: DropArea {
            id: delegateRoot
            width: 316; height: 526
            keys: "AppButton"

            property string appFocus: app.focus //=====================================

            onEntered: visualModel.items.move(drag.source.visualIndex, icon.visualIndex)

            property int visualIndex: DelegateModel.itemsIndex
            Binding { target: icon; property: "visualIndex"; value: visualIndex }

            // Sau khi drag/drop thì trả lại focus về appListMenu
            // Nếu không thì sẽ không thể nhấn hardkey
            onExited: {
                appListMenu.focus = true
            }

            onActiveFocusChanged:  {
//                if(widgetArea.activeFocus === false) {
//                    app.focus = true
//                }
                app.focus = true
                app.state = "Focus"
            }
            Keys.onEnabledChanged: {
                app.focus = true
                app.state = "Focus"
            }

            Keys.onPressed: {
                // Khi nhấn Up/Down thì chuyển focus lên Widget, do đó bỏ focus tại app list
                app.focus = true
                if (event.key === Qt.Key_Up || event.key === Qt.Key_Down) {
                    widgetArea.forceActiveFocus()
                    focusPosition = "Widget"
                    app.state = "Normal"
                }               

                // Xử lý mở app khi nhấn Enter
                // Chú ý: Qt.Key_Enter: enter trên bàn phím số (numpad)
                // Qt.Key_Return: Enter bàn phím thường
                if(event.key === Qt.Key_Enter || event.key === Qt.Key_Return) {
                    homeScreen.openApplication(model.url)
                    console.log("Open " + app.title)
                }

                // ---------------------- Hardkeys Reorder ------------------------------
                // Nhấn giữ Shift + Left/Right để sắp xếp application list
                if((event.modifiers & Qt.ShiftModifier) && (event.key === Qt.Key_Left)) {
                    console.log("Shift + move to left" )
                    visualModel.items.move(visualIndex,visualIndex -1,1)
                    event.accepted = true
                }
                if((event.modifiers & Qt.ShiftModifier) && (event.key === Qt.Key_Right)) {
                    console.log("Shift + move to right" )
                    visualModel.items.move(visualIndex,visualIndex +1,1)
                    event.accepted = true
                }
            }

            Keys.onReleased: {
                app.focus = true
                app.state = "Focus"
                console.log("Select app: " + app.title)

                for (var index = 0; index < visualModel.items.count;index++){
                    if (index !== icon.visualIndex) {
                        visualModel.items.get(index).focus = false
                    }
                    else {
                        visualModel.items.get(index).focus = true
                    }
                }
            }

            Item {
                id: icon
                property int visualIndex: 0
                width: 316; height: 526
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

                    onClicked: homeScreen.openApplication(model.url)

                    // Press & hold (800ms) thì phóng to icon
                    onPressAndHold:  {
                        app.focus = true
                        app.state = "Drag"
                    }

                    // Chuyển focus vào button được click, bỏ focus ở các button khác
                    onPressed:  {
                        app.focus = true
                        app.state = "Focus"
                        for (var index = 0; index < visualModel.items.count;index++){
                            if (index !== icon.visualIndex) {
                                visualModel.items.get(index).focus = false
                            }
                            else {
                                visualModel.items.get(index).focus = true
                            }
                        }
                    }

                    onWheel: {
                        if(wheel.angleDelta.y < 0 && appListMenu.currentIndex < appListMenu.count) {
                            appListMenu.incrementCurrentIndex()
                        }
                        if(wheel.angleDelta.y > 0 && appListMenu.currentIndex >0) appListMenu.decrementCurrentIndex()
                        console.log("Mouse wheels..." + appListMenu.currentIndex)
                    }
                }

                Drag.active: app.state == "Drag"        // cho phép drag khi press & hold
                Drag.source: icon
                Drag.keys: "AppButton"
                Drag.hotSpot.x: delegateRoot.width*2/3
                Drag.hotSpot.y: delegateRoot.height*2/3

                states: [
                    State {
                        when: icon.Drag.active
                        ParentChange {
                            target: icon
                            parent: appListMenu
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

