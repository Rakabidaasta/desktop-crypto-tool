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
        }

        Page4Form {
            onEncode_bases: {
                if (pt === "") return

                result16 = bases.base16_encode(pt, pt.length)
                result64 = bases.base64_encode(pt, pt.length)
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
}
