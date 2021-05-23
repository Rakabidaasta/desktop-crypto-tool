import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.5

Page {
    id: page
    width: 600
    height: 400

    header: Label {
        text: qsTr("RSA")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    TextField {
        id: textEdit_p
        width: 524
        height: 56
        color: "#9b9b9b"
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 23
        anchors.topMargin: 5
        anchors.leftMargin: 32

        placeholderText: "Введите p..."
    }

    TextField {
        id: textEdit_q
        width: 524
        height: 56
        color: "#9b9b9b"
        anchors.left: parent.left
        anchors.top: textEdit_p.bottom
        font.pixelSize: 23
        anchors.leftMargin: 32
        anchors.topMargin: 5

        placeholderText: "Введите q..."
    }

    TextField {
        id: textEdit_e
        width: 524
        height: 56
        color: "#9b9b9b"
        anchors.left: parent.left
        anchors.top: textEdit_q.bottom
        font.pixelSize: 23
        anchors.leftMargin: 32
        anchors.topMargin: 5

        placeholderText: "Введите e..."
    }

    TextField {
        id: textEdit_ct
        width: 442
        height: 56
        color: "#9b9b9b"
        anchors.left: parent.left
        anchors.top: textEdit_e.bottom
        font.pixelSize: 23
        anchors.leftMargin: 32
        anchors.topMargin: 5

        placeholderText: "Введите зашифрованное сообщение..."
    }

    TextField {
        id: textEdit_res
        width: 494
        color: "#9b9b9b"
        anchors.left: parent.left
        anchors.top: textEdit_ct.bottom
        font.pixelSize: 23
        anchors.leftMargin: 32
        anchors.topMargin: 25
        placeholderText: "Результат"
        readOnly: true
    }

    Button {
        id: button
        y: 192
        text: qsTr("Готово")
        anchors.left: textEdit_ct.right
        anchors.leftMargin: 10
        highlighted: true
        Material.accent: Material.Greens
    }
}
