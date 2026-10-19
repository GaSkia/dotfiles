//@ pragma Env QT_STYLE_OVERRIDE=Fusion
//@ pragma UseQApplication 
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Hyprland
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts


PanelWindow {
    id: root
    anchors {
        top: true
        bottom: true
        left: true
    }

    implicitWidth: 32
    color: "#1e1e2e"

    ColumnLayout {
        anchors.fill: parent

        // INFO: Workspaces
        Rectangle {
            Layout.alignment: Qt.AlignTop
            Layout.margins: 6
            implicitWidth: workspaceColumn.implicitWidth
            implicitHeight: workspaceColumn.implicitHeight
            radius: height / 2 
            color: "transparent"

            Column {
                id: workspaceColumn
                required property var modelData
                spacing: 3

                Repeater {
                    model: Hyprland.workspaces
                    Rectangle {

                        id: workspaces
                        required property var modelData
                        width: 22
                        height: 22
                        radius: height / 2
                        color: modelData.focused ? "#79a0f7" : "#1e1e2e"

                        MouseArea {
                            anchors.fill: parent
                            acceptedButtons: Qt.LeftButton
                            onClicked: event => {
                                workspaces.modelData.activate()
                                console.log("click")
                            }
                            onEntered:  {
                                if (!workspaces.modelData.focused)
                                workspaces.color = "#bb1d1c"
                            }
                            hoverEnabled: true
                            onExited:  {
                                workspaces.color = workspaces.modelData.focused ? "#79a0f7" : "#1e1e2e"
                            }
                        }
                        Text {
                            id: workspaceText
                            text: workspaces.modelData.name
                            anchors.centerIn: parent
                            color: "#fff"
                            font {
                                weight: 600
                                family: "Fira Code"
                            }
                        }

                    }
                }
            }
        }

        // INFO: Clock
        Item {
            Layout.alignment: Qt.AlignCenter

            Text {
                id: clockText
                text: Qt.formatDateTime(clock.date, "hh\nmm")
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

        // INFO: Tray
        Column {

            Layout.alignment: Qt.AlignBottom
            Layout.margins: 6
            Repeater {
                model: SystemTray.items

                delegate: Item {
                    id: trayItem
                    required property var modelData

                    implicitWidth: 20
                    implicitHeight: 20

                    QsMenuAnchor {
                        id: trayMenu
                        menu: trayItem.modelData.menu
                        anchor.item: trayItem
                        anchor.edges: Edges.Left
                        anchor.gravity: Edges.Bottom
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
    }
}
