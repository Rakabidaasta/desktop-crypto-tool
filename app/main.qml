import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Window 2.14
import QtQuick.Controls.Material 2.5

ApplicationWindow {
    width: 640
    minimumHeight: 480
    minimumWidth: 600
    height: 480
    visible: true
    title: qsTr("Crypto")

    Material.theme: Material.Light
    Material.accent: Material.Green

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {

        }

        Page2Form {
            onCheck_hash: {
                if (strVal === "") {
                    bwidth = 1
                    result = ""
                    return
                }
                console.log(strVal.length)
                if (strVal.length !== 32) {
                    result = "Это не MD5 хэш!"
                    return
                }

                bwidth = 0
                var a = hash.check_hash(strVal)
                result = a
                return
            }

            onCopy: {
                bases.set_to_clipboard(text)

                notification_text.text = qsTr("Copied!")
                notification_timer.start()
                notification_appear.start()
            }
        }

        Page3Form {
            onSolve_RSA: {
                if (p === "") {
                    pbwidth = 1
                    result = ""
                    return
                }
                pbwidth = 0

                if (q === "") {
                    qbwidth = 1
                    result = ""
                    return
                }
                qbwidth = 0

                if (e === "") {
                    ebwidth = 1
                    result = ""
                    return
                }
                ebwidth = 0

                if (ct === "") {
                    ctbwidth = 1
                    result = ""
                    return
                }
                ctbwidth = 0

                result = rsa.solve_rsa(Number(p), Number(q), Number(e), Number(ct))
            }

            onCopy: {
                bases.set_to_clipboard(text)

                notification_text.text = qsTr("Copied!")
                notification_timer.start()
                notification_appear.start()
            }
        }

        Page4Form {
            onEncode_bases: {
                if (pt === "") return

                var result = bases.bases_encode(pt)
                result16 = result[0]
                result32 = result[1]
                result64 = result[2]
            }


            onCopy: {
                bases.set_to_clipboard(text)

                notification_text.text = qsTr("Copied!")
                notification_timer.start()
                notification_appear.start()
            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("О программе")
        }
        TabButton {
            text: qsTr("Хэши")
        }
        TabButton {
            text: qsTr("RSA")
        }
        TabButton {
            text: qsTr("Кодировки")
        }
    }

    Rectangle {
        id: notification
        width: 100
        height: 40
        radius: 10

        opacity: 0
        color: "#434343aa"

        anchors.bottom: tabBar.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 10

        Text {
            id: notification_text
            anchors.centerIn: parent
            text: qsTr("Notification")
        }

        OpacityAnimator {
            target: notification
            id: notification_appear;
            from: 0;
            to: 1;
            duration: 500
            running: false
        }
        OpacityAnimator {
            target: notification
            id: notification_disappear;
            from: 1;
            to: 0;
            duration: 500
            running: false
        }
    }

    Timer {
        id: notification_timer

        interval: 2000
        running: false
        repeat: false

        onTriggered: {
            notification_disappear.start()
        }
    }
}
