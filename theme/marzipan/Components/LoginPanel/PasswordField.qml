import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
	id: passwordField
	focus: true
	selectByMouse: true
	echoMode: TextInput.Password
	passwordCharacter: "•"
	passwordMaskDelay: config.PasswordShowLastLetter
	selectionColor: config.primary_l
	renderType: Text.NativeRendering
	font.family: config.Font
	font.pointSize: config.FontSize
	font.bold: true
	color: config.foreground
	horizontalAlignment: TextInput.AlignHCenter
	placeholderText: "Password"
	background: Rectangle {
		id: passFieldBackground
		radius: 10
		color: config.prompt
		border.color: config.unfocused
		border.width: 2
	}
	states: [
		State {
			name: "focused"
			when: passwordField.activeFocus
			PropertyChanges {
				target: passFieldBackground
				border.color: config.primary
			}
		},
		State {
			name: "hovered"
			when: passwordField.hovered
			PropertyChanges {
				target: passFieldBackground
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
