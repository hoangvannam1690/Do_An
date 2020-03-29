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
//        source: "http://media3.keeng.net/bucket-media-keeng/sas_01/video/2012/05/30/yeu-lai-tu-dau-1153.mp4"  //VOD
//        source: "https://ws.flv.nimo.tv/live/su1599512427622r073f84b376d62cfd26fbcf13e7ef5fd0.flv"  // Live Doreamon
//        source: "http://ws.flv.nimo.tv/live/su1599512427626re02097385902583d031254e5d6f0c321_high.flv" // Live
//        source: "https://v2bdoz1zs4.vcdn.com.vn/hls/ANTV_631/02.m3u8"   // Kênh An Ninh TV // Live
//        source: "http://113.164.225.140:1935/live/quochoitvlive.stream_720p/playlist.m3u8." // Live
//        source: "http://chipcun.dynu.com:333/xemtv47/xemtv47kenhthvl.m3u8?channel=thvl1" // Live
        source: "http://220.158.149.14:9999/live/TV00000000000000000115@HHZT;LIVE" // Live
//        source: "https://colygaleuo.vcdn.com.vn/hls/vtc7_sd.stream/chunklist_w339395720.m3u8" // Live
//        source: "http://htv-drm-live-cdn.fptplay.net/CDN-FPT02/CHANNELV-HD-1080p/playlist.m3u8"
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

