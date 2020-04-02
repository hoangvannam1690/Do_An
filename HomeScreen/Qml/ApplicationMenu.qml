import QtQuick 2.12
import QtQml.Models 2.1
import QtQuick.Controls 2.4

ListView {
    id: appListMenu

    orientation: ListView.Horizontal
    interactive: false //true       //FIXME
    spacing: 5
    clip: true

    highlightMoveDuration: 10

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
            width: 316; height: 526 //604
            keys: "AppButton"

            onEntered: visualModel.items.move(drag.source.visualIndex, icon.visualIndex)

            property int visualIndex: DelegateModel.itemsIndex
            Binding { target: icon; property: "visualIndex"; value: visualIndex }

            //==============================================================================
            // Sau khi drag/drop thì trả lại focus về appListMenu
            // Nếu không thì sẽ không thể nhấn hardkey
            onExited: {
                appListMenu.focus = true
            }

//                onFocusChanged: {
//                    if(appListMenu.focus === false)
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
                console.log("Select app: " + app.title)
            }

            //------------------------------------------------------------------

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
                }

                onFocusChanged: app.focus = icon.focus
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

//        //Scroll list app: chỉ hiển thị khi có nhiều hơn 6 app
//        //FIXME: Sử dụng mouse wheel
//        ScrollBar.horizontal:  ScrollBar {
//            id: scrollview
//            parent: appListMenu.parent
//            anchors.top: appListMenu.top
//            anchors.left: appListMenu.left
//            anchors.right: appListMenu.right
//            visible: visualModel.items.count > 6 ? true : false
//        }

    //============================
//        MouseArea {
//            anchors.fill: parent
//            onWheel: {
//                if(wheel.angleDelta.y > 0) {
//                    appListMenu.incrementCurrentIndex()
//                } else appListMenu.decrementCurrentIndex()
//                console.log("Mouse wheels..." + appListMenu.currentIndex)
//            }
//        }
}

