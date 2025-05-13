import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
	id: powerButton
	height: unitLength
	width: unitLength
	hoverEnabled: true
	icon {
		source: Qt.resolvedUrl("../../icons/power.svg")
		height: height
		width: width
		color: config.background
	}
	background: Rectangle {
		id: powerButtonBackground
		radius: 10
		color: config.primary
	}
	states: [
		State {
			name: "pressed"
			when: powerButton.down
			PropertyChanges {
				target: powerButton
				y: 3
			}
			PropertyChanges {
				target: powerButtonBackground
				color: config.primary_d
			}
		},
		State {
			name: "focused"
			when: powerButton.hovered || powerButton.activeFocus
			PropertyChanges {
				target: powerButtonBackground
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
	onClicked: sddm.powerOff()
}
