import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.5

Page {
    id: page
    width: 600
    height: 400

    header: Label {
        text: qsTr("Хэши")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    TextField {
        id: textEdit
        x: 39
        y: 154
        width: 370
        height: 61
        //        height: 50
        color: "#9b9b9b"
        font.pixelSize: 27

        placeholderText: "Введите MD5 хэш..."
    }

    TextField {
        id: textEdit2
        x: 39
        y: 231
        width: 494
        color: "#9b9b9b"
        font.pixelSize: 27
        placeholderText: "Результат"
        readOnly: true
    }

    Text {
        id: text1
        x: 39
        y: 6
        width: 494
        height: 91
        text: qsTr("На данный момент доступны подбор MD5 без соли.\nДля брутфорса хэша md5 используется вордлист rockyou")
        font.pixelSize: 20
        wrapMode: Text.WordWrap
    }

    Button {
        id: button
        y: 161
        text: qsTr("Готово")
        anchors.left: textEdit.right
        anchors.leftMargin: 52
        highlighted: true
        Material.accent: Material.Greens
    }
}
