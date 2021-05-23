import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.5

Page {
    id: page
    width: 600
    height: 400

    header: Label {
        text: qsTr("Кодировки")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    TextField {
        id: textEdit_pt
        width: 370
        height: 56
        color: "#9b9b9b"
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 23
        anchors.leftMargin: 32
        anchors.topMargin: 0

        placeholderText: "Введите сообщение..."
    }

    TextField {
        id: textEdit_b16
        width: 524
        color: "#9b9b9b"
        anchors.left: parent.left
        anchors.top: textEdit_pt.bottom
        font.pixelSize: 23
        anchors.leftMargin: 32
        anchors.topMargin: 25
        placeholderText: "Base16"
        readOnly: true
    }

    TextField {
        id: textEdit_b32
        width: 524
        height: 56
        color: "#9b9b9b"
        anchors.left: parent.left
        anchors.top: textEdit_b16.bottom
        font.pixelSize: 23
        anchors.leftMargin: 32
        anchors.topMargin: 11
        placeholderText: "Base32"
        readOnly: true
    }

    TextField {
        id: textEdit_b64
        width: 524
        height: 56
        color: "#9b9b9b"
        anchors.left: parent.left
        anchors.top: textEdit_b32.bottom
        font.pixelSize: 23
        anchors.leftMargin: 32
        anchors.topMargin: 11
        placeholderText: "Base64"
        readOnly: true
    }

    TextField {
        id: textEdit_a85
        width: 524
        height: 56
        color: "#9b9b9b"
        anchors.left: parent.left
        anchors.top: textEdit_b64.bottom
        font.pixelSize: 23
        anchors.leftMargin: 32
        anchors.topMargin: 11
        placeholderText: "Ascii85"
        readOnly: true
    }

    Button {
        id: button
        y: 8
        text: qsTr("Готово")
        anchors.left: textEdit_pt.right
        anchors.leftMargin: 80
        highlighted: true
        Material.accent: Material.Greens
    }

}
