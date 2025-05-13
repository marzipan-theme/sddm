import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
	id: sleepButton
	height: unitLength
	width: unitLength
	hoverEnabled: true
	icon {
		source: Qt.resolvedUrl("../../icons/sleep.svg")
		height: height
		width: width
		color: config.background
	}
	background: Rectangle {
		id: sleepButtonBackground
		radius: 10
		color: config.primary
	}
	states: [
		State {
			name: "pressed"
			when: sleepButton.down
			PropertyChanges {
				target: sleepButton
				y: 3
			}
			PropertyChanges {
				target: sleepButtonBackground
				color: config.primary_d
			}
		},
		State {
			name: "focused"
			when: sleepButton.activeFocus || sleepButton.hovered
			PropertyChanges {
				target: sleepButtonBackground
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
	onClicked: sddm.suspend()
}
