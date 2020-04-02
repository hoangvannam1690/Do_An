import QtQuick 2.11
import QtQuick.Controls 2.4
import QtMultimedia 5.12

Item {
    id: root
    width: 1920
    height: 1200-70
    focus: true

    Rectangle {
        id: rectAppTittle
        width: parent.width
        height: 100
        color: "transparent"
        Text {
            id: appTitle
            anchors.centerIn: parent
            text: "Setting"
            color: "white"
            font.pixelSize: 44
        }
    }
}


//Item {
//    width: 600
//    height: 600
//    property int itemWidth: 50

//    ListView {
//        id: view
//        model: new Array(1,2,3,4,5,6,7,8)
//        delegate: item
//        anchors {
//            top: parent.top;
//            topMargin: 10;
//            horizontalCenter:
//                parent.horizontalCenter;
//            bottom:
//                parent.bottom;
//        }
//        width: model.length * itemWidth + (model.length - 1) * spacing
//        spacing: 2
//        orientation: Qt.Horizontal
//        snapMode: ListView.SnapOneItem
//        highlightRangeMode: ListView.ApplyRange
//        interactive: false
//        Component.onCompleted: currentIndex = -1;
//    }


//    Component {
//        id: item

//        Rectangle {
//            width: itemWidth
//            height: 50
//            color: "red"
//            x: {
//                if (ListView.isCurrentItem) {
//                    if (view.flickingHorizontally) {
//                        (view.width/2)- (width/2)
//                    } else {
//                        (view.width/2)-(width/2)
//                    }
//                } else {
//                    if ( view.currentIndex==-1) {
//                        index * (width + view.spacing)
//                    } else {
//                        if ( index < view.currentIndex) {
//                            index * (width + view.spacing) + (width/2)
//                        } else {
//                            index * (width + view.spacing)- (width/2)
//                        }
//                    }
//                }
//            }
//            y: ListView.isCurrentItem ? 200 : 0
//            Behavior on x { SpringAnimation { spring: 4; damping: 0.4 } }
//            Behavior on y { SpringAnimation { spring: 4; damping: 0.4 } }

//            Text {
//                text: model.index
//            }

//            MouseArea {
//                anchors.fill: parent
//                onClicked: {
//                    if (!ListView.isCurrentItem)
//                        view.currentIndex = index;
//                    else
//                        view.currentIndex = –1;
//                }
//            }
//        }
//    }
//}
