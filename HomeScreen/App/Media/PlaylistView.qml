import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.1

Drawer {
    id: drawer
    property alias mediaPlaylist: mediaPlaylist
    interactive: false
    modal: false
    background: Rectangle {
        id: playList_bg
        anchors.fill: parent
        color: "transparent"
    }
    ListView {
        id: mediaPlaylist
        anchors.fill: parent
        model: myModel
        clip: true
        spacing: 2

        focus: true

        currentIndex: player.playlist.currentIndex
        delegate: MouseArea {
            property variant myData: model
            implicitWidth: playlistItem.width
            implicitHeight: playlistItem.height
            Image {
                id: playlistItem
                width: 675
                height: 193
                source: "qrc:/App/Media/Image/playlist.png"
                opacity: 0.5
            }
            Text {
                text: title
                anchors.fill: parent
                anchors.leftMargin: 70
                verticalAlignment: Text.AlignVCenter
                color: "white"
                font.pixelSize: 32
            }

            // --------------------- hardkey control ------------------------
            // Sử dụng phím Up/Down để chọn bài hát                     
            Keys.onReleased: {
                if(event.key === Qt.Key_Down || event.key === Qt.Key_Up) {
                    console.log("Select song")
                }

                // Nhấn Enter để Play/Pause
                if(event.key === Qt.Key_Enter || event.key === Qt.Key_Return) {
                    if(player.playlist.currentIndex !== index) {
                        player.playlist.currentIndex = index
                    }
                    player.play()
                }

                // Nhấn phím Backspace để về màn hình Home
                if(event.key === Qt.Key_Backspace) {
                    stackView.pop()
                }
            }

            // TODO: Nhấn phím Right để chuyển sang vùng mediaInfControl
            KeyNavigation.right: mediaInfoControl

            // --------------------- Mouse control ------------------------
            onClicked: {
                player.playlist.currentIndex = index
            }
            onPressed: {
                playlistItem.source = "qrc:/App/Media/Image/hold.png"
            }
            onReleased: {
                playlistItem.source = "qrc:/App/Media/Image/playlist.png"
            }
        }

        highlight: Image {
            source: "qrc:/App/Media/Image/playlist_item.png"
            Image {
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/App/Media/Image/playing.png"
            }
        }
        ScrollBar.vertical: ScrollBar {
            parent: mediaPlaylist.parent
            anchors.top: mediaPlaylist.top
            anchors.left: mediaPlaylist.right
            anchors.bottom: mediaPlaylist.bottom
        }
    }

    Connections{
        target: player.playlist
        onCurrentIndexChanged: {
            mediaPlaylist.currentIndex = index;
        }
    }
}
