import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "Components"

Item {
	readonly property var unitLength: Screen.height * 0.04

	id: root
	height: Screen.height
	width: Screen.width
	Rectangle {
		id: background
		anchors.fill: parent
		height: parent.height
		width: parent.width
		z: -1
		color: config.background
	}
	ButtonPanel {
		id: buttonPanel
		anchors {
			margins: 50
			left: parent.left
			bottom: parent.bottom
		}
	}
	LoginPanel {
		id: loginPanel
		z: 2
		anchors {
			verticalCenter: parent.verticalCenter
			horizontalCenter: parent.horizontalCenter
		}
	}
	Clock {
		id: time
		anchors {
			margins: 50
			top: parent.top
			right: parent.right
		}
	}
}
