import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.5

Page {
    id: page
    width: 600
    height: 400

    property string result16: ""
    property string result32: ""
    property string result64: ""
    property int pbwidth: 0

    signal encode_bases(var pt)
    signal copy(var text)

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
        anchors.topMargin: 6

        background: Rectangle {
            radius: 0
            implicitWidth: 100
            implicitHeight: 24
            border.color: "#F44336"
            border.width: page.pbwidth
        }

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
        anchors.topMargin: 26
        placeholderText: "Base16"
        readOnly: true
        text: page.result16

        MouseArea {
            id: b16_ma
            anchors.fill: parent
        }

        Connections {
            target: b16_ma
            onClicked: page.copy(textEdit_b16.text)
        }
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
        anchors.topMargin: 26
        placeholderText: "Base32"
        readOnly: true
        text: page.result32

        MouseArea {
            id: b32_ma
            anchors.fill: parent
        }

        Connections {
            target: b32_ma
            onClicked: page.copy(textEdit_b32.text)
        }
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
        anchors.topMargin: 26
        placeholderText: "Base64"
        readOnly: true
        text: page.result64

        MouseArea {
            id: b64_ma
            anchors.fill: parent
        }

        Connections {
            target: b64_ma
            onClicked: page.copy(textEdit_b64.text)
        }
    }

    Button {
        id: button4
        y: 14
        text: qsTr("Готово")
        anchors.left: textEdit_pt.right
        anchors.leftMargin: 80
        highlighted: true
        Material.accent: Material.Greens

        Connections {
            target: button4
            onClicked: page.encode_bases(textEdit_pt.text)
        }
    }
}
