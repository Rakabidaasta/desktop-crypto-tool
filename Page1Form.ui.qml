import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

Page {
    id: page
    width: 600
    height: 400

    header: Label {
        text: qsTr("Описание")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    QtObject{
        id: descriptionMd
        property string markdown_text: "
**Crypto** - приложение для часто встречаемых задач в CTF-соревнованиях.

Функции:
- подбор хэш;
- дешифровка RSA;
- перевод из одной кодировки в другую."}


    Row {
        id: row
        anchors.fill: parent


        Text {
            id: description
            Layout.fillWidth: true
            textFormat: Text.MarkdownText
            text: descriptionMd.markdown_text
            font.pixelSize: 22
            wrapMode: Text.WordWrap

            anchors.left: row.left
            anchors.right: row.right
            anchors.top: row.top
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            anchors.topMargin: 10
        }

        Image {
            id: image
            source: "./images/cryptochka_img.svg"
            sourceSize.height: 512
            sourceSize.width: 512
            fillMode: Image.PreserveAspectFit
            anchors.top: description.bottom
            anchors.bottom: row.bottom
            anchors.left: row.left
            anchors.right: row.right
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.1}D{i:5}
}
##^##*/
