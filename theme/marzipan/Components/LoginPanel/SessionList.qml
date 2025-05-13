import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQml.Models 2.15

ListView {
	id: sessionList
	spacing: 10
	enabled: false
	model: sessionModel
	height: (unitLength + 10) * Math.min(model.count, 6)
	clip: true
	delegate: Component {
		id: sessionDelegate
		Button {
			id: sessionEntry
			height: unitLength
			width: parent.width
			highlighted: sessionList.currentIndex == index
			contentItem: Text {
				renderType: Text.NativeRendering
				font.family: config.Font
				font.pointSize: config.FontSize
				font.bold: true
				horizontalAlignment: Text.AlignHCenter
				verticalAlignment: Text.AlignVCenter
				color: config.foreground
				text: name
			}
			background: Rectangle {
				id: sessionEntryBackground
				color: config.prompt
				radius: 10
				border.color: config.primary
				border.width: highlighted ? 2 : 0
			}
			states: [
				State {
					name: "pressed"
					when: sessionEntry.down
					PropertyChanges {
						target: sessionEntry
						y: (unitLength + 10) * index + 3
					}
					PropertyChanges {
						target: sessionEntryBackground
						color: config.unfocused
					}
				},
				State {
					name: "hovered"
					when: sessionEntry.hovered || sessionEntry.activeFocus
					PropertyChanges {
						target: sessionEntryBackground
						color: config.unfocused
					}
				}
			]
			transitions: Transition {
				PropertyAnimation {
					properties: "color"
					duration: 100
				}
				PropertyAnimation {
					properties: "y"
					duration: 25
				}
			}
			onClicked: {
				sessionList.currentIndex = index
				sessionList.close()
			}
			opacity: 0
			NumberAnimation on opacity {
				id: fadeIn
				from: 0
				to: 1
				duration: 400
				easing.type: Easing.OutExpo
				running: false
			}
			Timer {
				id: fadeInTime
				interval: index * 50
				onTriggered: {
					fadeIn.start()
				}
			}
			NumberAnimation on opacity {
				id: fadeOut
				from: 1
				to: 0
				duration: 400
				easing.type: Easing.OutExpo
				running: false
			}
			Timer {
				id: fadeOutTime
				interval: (sessionModel.count - index - 1) * 50
				onTriggered: {
					fadeOut.start()
				}
			}
			Connections {
				target: sessionList
				function onStateChanged(state) {
					if (state == "open") {
						fadeInTime.start()
					} else if (state == "closed") {
						fadeOutTime.start()
					}
				}
			}
		}
	}
	currentIndex: sessionModel.lastIndex
	function open() {
		sessionList.state = "open"
	}
	function close() {
		sessionList.state = "closed"
	}
	states: [
		State {
			name: "open"
			PropertyChanges {
				target: sessionList
				enabled: true
			}
		}
	]
}
