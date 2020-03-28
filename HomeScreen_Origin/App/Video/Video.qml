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
//        source: "http://media3.keeng.net/bucket-media-keeng/sas_01/video/2012/05/30/yeu-lai-tu-dau-1153.mp4"
//        source: "http://ws.flv.nimo.tv/live/su1599512427626re02097385902583d031254e5d6f0c321_high.flv"
        source: "https://v2bdoz1zs4.vcdn.com.vn/hls/ANTV_631/02.m3u8"   // Kênh An Ninh TV
//        source: "https://data32.chiasenhac.com/downloads/1927/6/1926462-43c2152d/flac/Lien%20Khuc_%20Ngay%20Xua%20Anh%20Noi_%20Boi%20Bac%20-%20T.mp4"
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

