import QtQuick 2.6
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtWebSockets 1.0
import 'api' as API


Window {
    	id: root
	API.Binding {
        id: binding
        url: bindingAddress
        onFanSpeedChanged: fanSpeedSlider.value = fanSpeed
    }

         // WINDOW PROPERTIES

        visible: true
        width: 1366
        height: 768

        property string status_str: ""
	RowLayout {
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignHCenter
            Item {
                width: 0.8 * 0.8
                Slider {
                    id: fanSpeedSlider
                    height: 136
                    anchors.verticalCenterOffset: 272
                    anchors.leftMargin: 548
                    anchors.rightMargin: -771
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    from: 0.0
                    to: 255.0
                    stepSize: 1.0
                    onValueChanged: {
                        binding.fanSpeed = value
                    }
                }
                Label {
                    id: label
                    width: 270
                    height: 92
                    anchors.left: fanSpeedSlider.left
                    anchors.top: fanSpeedSlider.bottom
                    font.pixelSize: 32
                    text: "FAN SPEED"
		    color: "blue"
                    anchors.leftMargin: 31
                    anchors.topMargin: 14
                }
            }
        }
        ColumnLayout {
                x: 932
           	y: 188
           	Layout.fillHeight: true
                Layout.alignment: Qt.LeftToRight
                Layout.fillWidth: true
                spacing: 20
                HeatDegree {
                    onCurrentItemChanged: {
                        console.log("Left Temp changed",degree)
                        binding.leftTemperature = degree
                    }
                }
		
            }
	ColumnLayout {
		x: 80
        	y: 188
        	Layout.fillHeight: true
                Layout.alignment: Qt.RightToLeft
                Layout.fillWidth: true
                spacing: 20
                HeatDegree {
                    onCurrentItemChanged: {
                        console.log("Right Temp changed",degree)
                        binding.rightTemperature = degree
                    }
                }
            }
}
