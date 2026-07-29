import Quickshell
import Quickshell.Wayland
import QtQuick
import "Widgets"

PanelWindow {

    anchors {
        top: true
        bottom: true
        right: true
    }

    implicitWidth: 32

    color: "transparent"

    Rectangle {
        anchors.fill: parent
        color:  "#1e1e2e"
        radius: 8

        Row {
            anchors.centerIn: parent

            spacing: 20

            Clock {
                format: "HH\r\nmm\r\nss"
                textColor: "#cdd6f4"
            }
        }
    }
}
