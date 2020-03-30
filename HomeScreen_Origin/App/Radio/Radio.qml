import QtQuick 2.11
import QtQuick.Controls 2.4
import QtMultimedia 5.12

Item {
    id: root
    width: 1920
    height: 1200-70

    focus: true
    Audio {
        id: radio

// TODO: Đưa vào listview
        source: "https://5a6872aace0ce.streamlock.net/nghevovgthcm/vovgthcm.stream_aac/playlist.m3u8" //VOV Giao Thông HCM
//        source: "https://5a6872aace0ce.streamlock.net/nghevovgthn/vovgthn.stream_aac/chunklist_w1165648695.m3u8" //VOV Giao Thông HN
//        source: "https://5a6872aace0ce.streamlock.net/nghevov247/vov247.stream_aac/playlist.m3u8" //VOV247
//        source: "http://125.212.213.71:1935/live/channel3/playlist.m3u8" // Kênh VOH 99.9
//        source: "http://125.212.213.71:1935/live/channel1/playlist.m3u8"  // VOH 95.6
    }

    Rectangle {
        id: rectAppTittle
        width: parent.width
        height: 100
        color: "transparent"
        Text {
            id: appTitle
            anchors.centerIn: parent
            text: "Radio"
            color: "white"
            font.pixelSize: 44
        }
    }

    // Ảnh động, hiển thị animate khi phát radio và dừng khi stop radio
    AnimatedImage {
        id: animationRadio
        scale: 0.6
        anchors.centerIn: parent
        source: "qrc:/Img/Radio/Radio.gif"
        playing: false
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            player.pause()
            animationRadio.playing = radio.playbackState !== MediaPlayer.PlayingState ? true : false
            radio.playbackState == MediaPlayer.PlayingState ? radio.stop() : radio.play()
        }
    }

    // Xử lý hardkey
    Keys.onPressed: {
        player.pause()
        if(event.key === Qt.Key_Enter || event.key === Qt.Key_Return) {
            animationRadio.playing = radio.playbackState !== MediaPlayer.PlayingState ? true : false
            radio.playbackState == MediaPlayer.PlayingState ? radio.stop() : radio.play()
            console.log("Play/Stop radio.")
        }

        //TODO: cần hiển thị biểu tượng volume, Value: 0.0 -> 1.0
        if(event.key === Qt.Key_Plus) radio.volume += 0.1
        if(event.key === Qt.Key_Minus) radio.volume -= 0.1
    }
}

