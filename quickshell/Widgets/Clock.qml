import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Item {
    id: root

    property date time: new Date()
    property string format: "HH\r\nmm\r\nss"
    property string textColor: "#ffffff"

    implicitWidth: clock.width
    implicitHeight: clock.height
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: root.time = new Date()
    }

    ColumnLayout {
        id: clock
        anchors.centerIn: parent

        Text {
            Layout.alignment: Qt.AlignHCenter

            id: hours 
            text: Qt.formatDateTime(root.time, "HH")

            font {
                pixelSize: 12
                family: "JetBrains Mono"
                bold: true
            }
            color: root.textColor

        }
        Text {
            id: minutes 
            Layout.alignment: Qt.AlignHCenter

            text: Qt.formatDateTime(root.time, "mm")
            font {
                pixelSize: 12
                family: "JetBrains Mono"
                bold: true
            }
            color: root.textColor
        }
        Text {
            id: seconds 
            Layout.alignment: Qt.AlignHCenter

            text: Qt.formatDateTime(root.time, "ss")
            font {
                pixelSize: 8
                family: "JetBrains Mono"
                bold: true
            }
            color: root.textColor
        }
    }
}
