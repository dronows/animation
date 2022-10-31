import QtQuick 2.12
import QtQuick.Window 2.12

Window {
	id:root
	width: 640
	height: 480
	visible: true
	title: qsTr("Make transition")

	Rectangle{
		id:scene
		anchors.fill:parent
		state:"OtherState"

		Rectangle{
			id:leftrectangle
			x:100
			y:200
			color:"lightgrey"
			width:100
			height:100
			border.color:"black"
			border.width: 3
			radius:5
			MouseArea{
				anchors.fill:parent
				onClicked: { if(ball.x >= rightrectangle.x) scene.state = "InitialState"
							 else { ball.x += 30
									scene.state = "OtherState"
							 }
				}

		   }
		}
		Rectangle{
			id:rightrectangle
			x:300
			y:200
			color:"lightgrey"
			width:100
			height:100
			border.color:"black"
			border.width: 3
			radius:5
			MouseArea{
				anchors.fill:parent
				onClicked:scene.state = "InitialState"
			}
		}

		Rectangle{
			id:ball
			color:"darkgreen"
			x:leftrectangle.x+5
			y:leftrectangle.y + 5
			width:leftrectangle.width - 10
			height:leftrectangle.height - 10
			radius:width / 2
		}
		states:[
		   State{
				name:"InitialState"
				PropertyChanges{
					target:ball
					x:leftrectangle.x + 5
				}
			},
			State{
				name:"OtherState"
				PropertyChanges{
					target:ball
					x:ball.x
				}
			}
		]

		transitions: [
			Transition {
			from:"OtherState"
			to:"InitialState"
			NumberAnimation{
				properties:"x,y"
				duration: 1000
				easing.type: Easing.OutBounce

			}
		}

		]
	}

}
