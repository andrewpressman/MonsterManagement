extends Node

var Select : Button
var Smallinfo : Panel
var BigInfo : Panel

var isPanelExpanded : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Smallinfo = $MiniInfo
	BigInfo = $BigInfo
	BigInfo.hide()

func _on_Select_Pressed(): # Toggle panel size and update internal text
	if isPanelExpanded:
		Smallinfo.show()
		BigInfo.hide()
	else:
		Smallinfo.hide()
		BigInfo.show()

	isPanelExpanded = not isPanelExpanded
