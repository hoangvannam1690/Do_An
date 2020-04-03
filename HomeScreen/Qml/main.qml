/*          Keyboard define
    - Khi khởi động app, nhấn Enter để bắt đầu nagivation
    - Nhấn Enter để mở app tương ứng
    - Nhấn Backspace để quay về Home
    - Nhấn Shift + Left/Right để reorder
*/
import QtQuick 2.11
import QtQuick.Window 2.0
import QtQuick.Controls 2.4

ApplicationWindow {
    id: window
    visible: true
    width: 1920
    height: 1200
    Image {
        id: background
        width: 1920
        height: 1200
        source: "qrc:/Img/bg_full.png"
    }

    // Định nghĩa vị trí focus
    // Sử dụng thuộc tính này để quay lại vị trí focus trước khi mở app
    //      Widget: Widget area
    //      AppMenu: Application menu area
    property string focusPosition: "Main"

    // ----------------- Status Area ---------------------
    StatusBar {
        id: statusBar
        onBntBackClicked: stackView.pop()
        isShowBackBtn: stackView.depth == 1 ? false : true
    }

    // Home Screen windows, bao gồm Widget area và Application menu area
    Item {
        id: homeScreen
        width: 1920
        height: 1096

        function openApplication(url){
            parent.push(url)
        }

        //======================= Xử lý Hardkeys =======================
        // Nhấn Enter hiện focus ở widget, được phép nhấn hardkey nagivation
        Keys.onPressed: {
            if(event.key === Qt.Key_Enter ||event.key === Qt.Key_Return) {
                if(homeScreen.focus === true) widgetArea.focus = true
            }
        }
        // ----------------- Widget Area ---------------------
        WidgetArea {
            id: widgetArea
            spacing: 10
            orientation: ListView.Horizontal
            width: 1920
            height: 570
        }
        // ------------- Application men Area ----------------
        ApplicationMenu {
            id: applicationMenu
            x: 0
            y: 570
            width: 1920; height: 526
        }
    }

    // Hiệu ứng khi mở app và khi thoát app trở về home
    StackView {
        id: stackView
        width: 1920
        anchors.top: statusBar.bottom
        initialItem: homeScreen

        onCurrentItemChanged: {
            currentItem.forceActiveFocus()
        }
        pushExit: Transition {
            XAnimator {
                from: 0
                to: -1920
                duration: 200
                easing.type: Easing.OutCubic
            }
        }

        popEnter : Transition {
            XAnimator {
                from: -1920
                to: 0
                duration: 200
                easing.type: Easing.InCubic
            }
        }
        //************************ Hardkey ********************************
        // Nhấn phím Backspace trên bàn phím
        Keys.onPressed: {
            if (event.key === Qt.Key_Backspace && stackView.depth !== 1) {
                console.log("back to home screen.............")
                stackView.pop()

                // Trả focus về vị trí trước khi mở ứng dụng
                if(focusPosition === "Widget") widgetArea.forceActiveFocus()
                if(focusPosition === "AppMenu") applicationMenu.forceActiveFocus()
            }
        }
    }
}
