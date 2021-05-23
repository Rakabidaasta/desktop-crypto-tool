import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 600
    height: 400

    header: Label {
        text: qsTr("Page 1")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Row {
        id: row
        anchors.fill: parent

        Label {
            id: page_lbl
            text: qsTr("Описание программы... Фичи и т.п.")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.topMargin: 0
            anchors.verticalCenterOffset: -136
            anchors.horizontalCenterOffset: 1
        }

        Image {
            id: image
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: page_lbl.bottom
            anchors.bottom: parent.bottom
            source: "images/cryptochka_img.svg"
            anchors.bottomMargin: 100
            sourceSize.height: 512
            sourceSize.width: 512
            anchors.topMargin: 50
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            width: 300
            fillMode: Image.PreserveAspectFit
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.33}D{i:4}D{i:2}
}
##^##*/
