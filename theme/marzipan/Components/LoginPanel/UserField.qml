import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
	id: userField
	selectByMouse: true
	echoMode: TextInput.Normal
	selectionColor: config.primary_l
	renderType: Text.NativeRendering
	font.family: config.Font
	font.pointSize: config.FontSize
	font.bold: true
	color: config.foreground
	horizontalAlignment: Text.AlignHCenter
	placeholderText: "Username"
	text: userModel.lastUser
	background: Rectangle {
		id: userFieldBackground
		radius: 10
		color: config.prompt
		border.color: config.unfocused
		border.width: 2
	}
	states: [
		State {
			name: "focused"
			when: userField.activeFocus
			PropertyChanges {
				target: userFieldBackground
				border.color: config.primary
			}
		},
		State {
			name: "hovered"
			when: userField.hovered
			PropertyChanges {
				target: userFieldBackground
				border.color: config.secondary
			}
		}
	]
	transitions: Transition {
		PropertyAnimation {
			properties: "border.color"
			duration: 300
		}
	}
}
