import Quickshell
import QtQuick

Item {
    implicitWidth: clockText.implicitWidth
    implicitHeight: clockText.implicitHeight
    anchors.centerIn: parent

    Text {
        id: clockText
        text: Qt.formatDateTime(clock.date, "hh:mm")
        color: "#fff"
        font {
            weight: 600
        }
        SystemClock {
            id: clock
            precision: SystemClock.Minutes
        }

    }
}
