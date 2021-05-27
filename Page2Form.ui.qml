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

    property string result: ""
    property int bwidth: 0

    signal check_hash(var strVal)
    signal copy(var text)

    TextField {
        id: textEdit
        x: 39
        y: 154
        width: 406
        height: 61
        color: "#9b9b9b"
        font.pixelSize: 27
        background: Rectangle {
            radius: 0
            implicitWidth: 100
            implicitHeight: 24
            border.color: "#F44336"
            border.width: page.bwidth
        }

        placeholderText: "Введите MD5 хэш..."
    }

    TextField {
        id: textRes
        x: 39
        y: 231
        width: 524
        color: "#9b9b9b"
        font.pixelSize: 27
        placeholderText: "Результат"
        text: page.result
        readOnly: true

        MouseArea {
            id: res_ma
            anchors.fill: parent
        }

        Connections {
            target: res_ma
            onClicked: page.copy(textRes.text)
        }
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
        anchors.leftMargin: 46
        highlighted: true
        Material.accent: Material.Greens

        Connections {
            target: button
            onClicked: page.check_hash(textEdit.text)
        }
    }
}
