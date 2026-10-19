import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

Scope {
    id: root
    property bool shouldShowOsd: false

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    Connections {
        target: Pipewire.defaultAudioSink?.audio
        function onVolumeChanged() {
            root.shouldShowOsd = true;
            hideTimer.restart();
        }
    }

    Timer {
        id: hideTimer
        interval: 1000
        onTriggered: root.shouldShowOsd = false
    }

    LazyLoader {
        active: root.shouldShowOsd
		PanelWindow {
			// Since the panel's screen is unset, it will be picked by the compositor
			// when the window is created. Most compositors pick the current active monitor.

			anchors.top: true
			margins.top: 60
			exclusiveZone: 0

			implicitWidth: 400
			implicitHeight: 50
			color: "transparent"

			// An empty click mask prevents the window from blocking mouse events.
			mask: Region {}

			Rectangle {
				anchors.fill: parent
				radius: height / 2
				color: "#1e1e2e"

				RowLayout {
					anchors {
						fill: parent
						leftMargin: 10
						rightMargin: 15
					}

					IconImage {
						implicitSize: 24
						source: Quickshell.iconPath("/usr/share/icons/breeze-dark/status/24/audio-volume-high.svg")
					}

					Rectangle {
						// Stretches to fill all left-over space
						Layout.fillWidth: true

						implicitHeight: 10
						radius: 20
						color: "#79a0f7"

						Rectangle {
                        color: "#8fabea"
							anchors {
								left: parent.left
								top: parent.top
								bottom: parent.bottom
							}

							implicitWidth: parent.width * (Pipewire.defaultAudioSink?.audio.volume ?? 0)
							radius: parent.radius
						}
					}
				}
			}
		}

    }
    
}
