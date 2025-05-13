import QtQuick 2.15
import "ButtonPanel"

Row {
	spacing: 10
	PowerButton { id: powerButton }
	RebootButton { id: rebootButton }
	SleepButton { id: sleepButton }
}
