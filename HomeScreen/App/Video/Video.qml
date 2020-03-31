import QtQuick 2.11
import QtQuick.Controls 2.4
import QtMultimedia 5.12

Item {
    id: root
    width: 1920
    height: 1200-70
    focus: true

    Video {
        id: video
        implicitWidth: parent.width
        implicitHeight: parent.height
        fillMode: VideoOutput.Stretch
         source: "https://ws.flv.nimo.tv/live/su1599512427578r00bac8d56488f6ca2d6915fb95ab88e8.flv" // Doreamon
        // source: "http://ws.flv.nimo.tv/live/su1599512427560r1e0b7afba22fec0a5191643a588e9f06_high.flv"  // Larva
//         source: "https://www.freedesktop.org/software/gstreamer-sdk/data/media/sintel_trailer-480p.mkv"
    }    

    Image {
        id: mImage
        source: "qrc:/Img/Video/Play_Button.png"
        width: 350
        height: 350
        anchors.centerIn: parent
        visible: true
    }

    Rectangle {
        id: rectAppTittle
        width: parent.width
        height: 100
        color: "transparent"
        Text {
            id: appTitle
            anchors.right:  parent.right
            anchors.rightMargin: 60
            text: "Live TV"
            color: "white"
            font.pixelSize: 44
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            player.pause()  // Dừng Phát nhạc trước khi phát Video
            mImage.visible = video.playbackState == MediaPlayer.PlayingState ? true : false
            video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
        }
    }

    Keys.onPressed: {
        player.pause()
        if(event.key === Qt.Key_Enter || event.key === Qt.Key_Return) {
            mImage.visible = video.playbackState == MediaPlayer.PlayingState ? true : false
            video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
        }
    }
}

