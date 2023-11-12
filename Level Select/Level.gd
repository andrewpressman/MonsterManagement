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
	#Send variables to scene from here? 
	pass

	isPanelExpanded = not isPanelExpanded
