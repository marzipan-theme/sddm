import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects

Button {
	id: optionsButton
	Image {
		source: Qt.resolvedUrl("../../icons/settings.svg")
		sourceSize: Qt.size(width, height)
		anchors.verticalCenter: parent.verticalCenter
		anchors.horizontalCenter: parent.horizontalCenter
		height: parent.height * 0.6
		width: parent.height * 0.6
		ColorOverlay {
			source: parent
			anchors.fill: parent
			color: config.background
		}
		transformOrigin: Item.Center
		NumberAnimation on rotation {
			id: iconRotate
			from: rotation
			to: 90
			duration: 200
		}
		NumberAnimation on rotation {
			id: iconUnrotate
			from: rotation
			to: -90
			duration: 200
		}
		Connections {
			target: sessionList
			function onStateChanged(state) {
				if (state == "open") {
					iconRotate.start()
				} else if (state == "closed") {
					iconUnrotate.start()
				}
			}
		}
	}
	background: Rectangle {
		id: buttonBackground
		radius: 10
		color: config.primary
	}
	states: [
		State {
			name: "pressed"
			when: optionsButton.down
			PropertyChanges {
				target: optionsButton
				y: 3
			}
			PropertyChanges {
				target: buttonBackground
				color: config.primary_d
			}
		},
		State {
			name: "focused"
			when: optionsButton.activeFocus || optionsButton.hovered
			PropertyChanges {
				target: buttonBackground
				color: config.primary_d
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
		if (sessionList.state == "open") {
			sessionList.close()
		} else {
			sessionList.open();
		}
	}
}
