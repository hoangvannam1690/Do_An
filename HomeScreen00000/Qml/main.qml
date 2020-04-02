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

    StatusBar {
        id: statusBar
        onBntBackClicked: stackView.pop()
        isShowBackBtn: stackView.depth == 1 ? false : true
    }

    StackView {
        id: stackView
        width: 1920
        anchors.top: statusBar.bottom
        initialItem: HomeWidget{}

        onCurrentItemChanged: {
            currentItem.forceActiveFocus()
        }
        pushExit: Transition {
            XAnimator {
                from: 0
                to: -1920
                duration: 5000  //200
                easing.type: Easing.OutCubic
            }
        }

        popEnter : Transition {
            XAnimator {
                from: -1920
                to: 0
                duration: 5000  //200
                easing.type: Easing.InCubic
            }
        }
        //************************ Hardkey ********************************
        // Nhấn phím Backspace trên bàn phím
        Keys.onPressed: {
            if (event.key === Qt.Key_Backspace && stackView.depth !== 1) {
                console.log("back to home screen.............")
                stackView.pop()
            }
        }
    }
}
