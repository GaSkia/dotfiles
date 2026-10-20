import Quickshell.Services.SystemTray
import Quickshell
import QtQuick

Row {

    spacing: 6
    Repeater {
        model: SystemTray.items

        delegate: Rectangle{
            id: trayItem
            required property var modelData

            implicitWidth: 20
            implicitHeight: 20
            color: "transparent"

            QsMenuAnchor {
                id: trayMenu
                menu: trayItem.modelData.menu
                anchor.item: trayItem
                anchor.edges: Qt.Edges.Left
                anchor.gravity: Qt.Edges.Bottom
            }

            Image {
                anchors.centerIn: parent
                source: trayItem.modelData.icon
                width: 20
                height: 20
                sourceSize.width: 20
                sourceSize.height: 20
                fillMode: Image.PreserveAspectFit
            }

            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton

                onClicked: mouse => {
                    if (mouse.button === Qt.LeftButton && trayItem.modelData.hasMenu) {
                        trayMenu.open()
                    } else if (mouse.button === Qt.RightButton && !trayItem.modelData.onlyMenu) {
                        trayItem.modelData.activate()
                        console.log(trayItem.modelData.title)
                    } else if (mouse.button === Qt.MiddleButton) {
                        trayItem.modelData.secondaryActivate()
                    }    
                }
            }
        }
    }
}
