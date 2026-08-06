// import Quickshell
// import Quickshell.Wayland
// import QtQuick
// import "Widgets"

// PanelWindow {

//     anchors {
//         top: true
//         bottom: true
//         left: true
//     }
//
//     implicitWidth: 32
//
//     color: "transparent"
//
//     Rectangle {
//         anchors.fill: parent
//         color:  "#1e1e2e"
//         radius: 8
//
//         Row {
//             anchors.centerIn: parent
//
//             spacing: 20
//
//             Clock {
//                 format: "HH\r\nmm\r\nss"
//                 textColor: "#cdd6f4"
//             }
//         }
//     }
// }

import Quickshell // for PanelWindow
import QtQuick // for Text

ShellRoot{

PanelWindow {
  anchors {
    bottom: true
    left: true
    right: true
  }

  implicitHeight: 30

  Text {
    // center the bar in its parent component (the window)
    anchors.centerIn: parent

    text: "hello world"
  }
}
}
