import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
	id: rebootButton
	height: unitLength
	width: unitLength
	hoverEnabled: true
	icon {
		source: Qt.resolvedUrl("../../icons/reboot.svg")
		height: height
		width: width
		color: config.background
	}
	background: Rectangle {
		id: rebootButtonBackground
		radius: 10
		color: config.primary
	}
	states: [
		State {
			name: "pressed"
			when: rebootButton.down
			PropertyChanges {
				target: rebootButton
				y: 3
			}
			PropertyChanges {
				target: rebootButtonBackground
				color: config.primary_d
			}
		},
		State {
			name: "focused"
			when: rebootButton.activeFocus || rebootButton.hovered
			PropertyChanges {
				target: rebootButtonBackground
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
	onClicked: sddm.reboot()
}
