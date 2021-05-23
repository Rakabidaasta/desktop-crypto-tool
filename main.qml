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
        }

        Page3Form {

        }

        Page4Form {

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
