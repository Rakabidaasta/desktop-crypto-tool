import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.5

Page {
    id: page
    width: 600
    height: 400

    property int pbwidth: 0
    property int qbwidth: 0
    property int ebwidth: 0
    property int ctbwidth: 0
    property string result: ""

    signal solve_RSA(var p, var q, var e, var ct)

    header: Label {
        text: qsTr("RSA")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    TextField {
        id: textEdit_p
        width: 493
        height: 56
        color: "#9b9b9b"
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 23
        anchors.topMargin: 5
        anchors.leftMargin: 63

        background: Rectangle {
            radius: 0
            implicitWidth: 100
            implicitHeight: 24
            border.color: "#F44336"
            border.width: page.pbwidth
        }

        placeholderText: "Введите p..."
    }

    TextField {
        id: textEdit_q
        width: 493
        height: 56
        color: "#9b9b9b"
        anchors.left: parent.left
        anchors.top: textEdit_p.bottom
        font.pixelSize: 23
        anchors.leftMargin: 63
        anchors.topMargin: 5

        background: Rectangle {
            radius: 0
            implicitWidth: 100
            implicitHeight: 24
            border.color: "#F44336"
            border.width: page.qbwidth
        }

        placeholderText: "Введите q..."
    }

    TextField {
        id: textEdit_e
        width: 493
        height: 56
        color: "#9b9b9b"
        anchors.left: parent.left
        anchors.top: textEdit_q.bottom
        font.pixelSize: 23
        anchors.leftMargin: 63
        anchors.topMargin: 5

        background: Rectangle {
            radius: 0
            implicitWidth: 100
            implicitHeight: 24
            border.color: "#F44336"
            border.width: page.ebwidth
        }

        placeholderText: "Введите e..."
    }

    TextField {
        id: textEdit_ct
        width: 411
        height: 56
        color: "#9b9b9b"
        anchors.left: parent.left
        anchors.top: textEdit_e.bottom
        font.pixelSize: 23
        anchors.leftMargin: 63
        anchors.topMargin: 5

        placeholderText: "Введите зашифрованное сообщение..."
    }

    TextField {
        id: textEdit_res
        width: 382
        height: 56
        color: "#9b9b9b"
        anchors.left: parent.left
        anchors.top: textEdit_ct.bottom
        font.pixelSize: 23
        anchors.leftMargin: 144
        anchors.topMargin: 25
        text: page.result
        placeholderText: ""
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

        Connections {
            target: button
            onClicked: page.solve_RSA(textEdit_p.text, textEdit_q.text,
                                      textEdit_e.text, textEdit_ct.text)
        }
    }

    Text {
        id: text1
        x: 11
        y: 18
        width: 46
        height: 30
        text: qsTr("p = ")
        font.pixelSize: 23
    }

    Text {
        id: text2
        x: 11
        y: 77
        width: 46
        height: 34
        text: qsTr("q = ")
        font.pixelSize: 23
    }

    Text {
        id: text3
        x: 11
        y: 138
        width: 46
        height: 34
        text: qsTr("e = ")
        font.pixelSize: 23
    }

    Text {
        id: text4
        x: 11
        y: 199
        width: 46
        height: 34
        text: qsTr("ct = ")
        font.pixelSize: 23
    }

    Text {
        id: text5
        x: 11
        y: 281
        text: qsTr("Результат:")
        font.pixelSize: 23
    }
}
