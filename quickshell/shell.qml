//@ pragma UseQApplication 
pragma ComponentBehavior: Bound

import Quickshell
import QtQuick
import QtQuick.Layouts
import "widgets/controls/floating"
import "bar"


PanelWindow {
    id: root
    anchors {
        top: true
        right: true
        left: true
    }

    implicitHeight: 32
    color: "#1e1e2e"

    Volume{}
    RowLayout {
        anchors.fill: parent
        spacing: 2

        Workspaces {
            id: workspaces
        }

        Clock {
            id: clock
        }

        Tray {
            id: tray
        }
    }
}
