import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
	id: loginButton
	enabled: userField.text != "" && passwordField.text != ""
	hoverEnabled: false
	contentItem: Text {
		id: buttonText
		renderType: Text.NativeRendering
		font.family: config.Font
		font.pointSize: config.FontSize
		font.bold: true
		horizontalAlignment: Text.AlignHCenter
		verticalAlignment: Text.AlignVCenter
		color: config.background
		text: "Login"
	}
	background: Rectangle {
		id: buttonBackground
		radius: 10
		color: config.unfocused
	}
	states: [
		State {
			name: "pressed"
			when: loginButton.down
			PropertyChanges {
				target: loginButton
				y: 3
			}
			PropertyChanges {
				target: buttonBackground
				color: config.primary_d
			}
		},
		State {
			name: "focused"
			when: loginButton.activeFocus || loginButton.hovered
			PropertyChanges {
				target: buttonBackground
				color: config.primary_d
			}
		},
		State {
			name: "enabled"
			when: loginButton.enabled
			PropertyChanges {
				target: buttonBackground
				color: config.primary
			}
			PropertyChanges {
				target: loginButton
				hoverEnabled: true
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
	onClicked: sddm.login(userField.text, passwordField.text, sessionList.currentIndex)
}
