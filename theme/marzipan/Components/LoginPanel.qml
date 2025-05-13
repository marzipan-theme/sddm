import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "LoginPanel"

Column {
	width: unitLength * 8
	spacing: 10
	Image {
		source: Qt.resolvedUrl("../assets/marzipan.png")
		width: parent.width * 1
		height: Screen.height / 4
		mipmap: true
		anchors.horizontalCenter: parent.horizontalCenter
		fillMode: Image.PreserveAspectFit
		z: 5
	}
	UserField {
		id: userField
		height: unitLength
		width: parent.width
	}
	PasswordField {
		id: passwordField
		height: unitLength
		width: parent.width
		onAccepted: loginButton.clicked()
	}
	Row {
		id: buttonRow
		spacing: 10
		width: parent.width
		readonly property var itemWidth: width / 2 - spacing / 2
		LoginButton {
			id: loginButton
			height: unitLength
			width: parent.itemWidth
		}
		OptionsButton {
			id: optionsButton
			height: unitLength
			width: parent.itemWidth
		}
	}
	Item {
		// HACK:
		// effectively a dummy item to position the session list in the column
		// without the lession list size effecting the rest of the column.
		height: 0.1; width: 0.1
		SessionList {
			z: 5
			id: sessionList
			width: parent.parent.width
			anchors.top: parent.bottom
		}
	}
	Connections {
		target: sddm
		function onLoginFailed() {
			passwordField.text = ""
			passwordField.focus = true
		}
	}
}
