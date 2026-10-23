//@ pragma Env QT_STYLE_OVERRIDE=Fusion
//@ pragma UseQApplication 
pragma ComponentBehavior: Bound
import QtQuick
import Quickshell.Hyprland

Row {
    id: root
    function colorWorkspace(ws: HyprlandWorkspace, model): bool {
        if (ws != null)
        ws.activate();
        for (let i = 0; i < model.count; i++) {
            console.log(model[i]);
            workspace.color = model[i].focused ? "#79a0f7" : "#1e1e2e"
        }

    }


    Repeater {
        model: Hyprland.workspaces
        id: workspaceRepeater
        delegate: Rectangle {

            id: workspace
            required property HyprlandWorkspace modelData
            width: 22
            height: 22
            radius: height / 2
            color: modelData.focused ? "#79a0f7" : "#1e1e2e"
            visible: modelData.id > 0

            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton
                onClicked: root.colorWorkspace(workspace.modelData)

                // onEntered: () => {
                //     if (!workspace.modelData.focused)
                //     workspace.color = "#bb1d1c"
                //     workspaceRepeater.model.foreach(item => {
                //         item.color= item.active ? "#79a0f7" : "#1e1e2e"
                //         console.log(item)
                //     })
                //
                // }
                // hoverEnabled: true
                // onExited: () => {
                //     workspace.color = workspace.modelData.focused ? "#79a0f7" : "#1e1e2e"
                //     workspaceRepeater.model.foreach(item => {
                //         item.color= item.active ? "#79a0f7" : "#1e1e2e"
                //         console.log(item)
                //     })
                // }
            }
            Text {
                id: workspaceText
                text: workspace.modelData.name
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
