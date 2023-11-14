extends Node

var Select : Button
var SmallInfo : Panel
var BigInfo : Panel

var isPanelExpanded : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	SmallInfo = $MiniInfo
	BigInfo = $BigInfo
	BigInfo.hide()

func hideBig():
	BigInfo.hide()
	
func hideSmall():
	SmallInfo.hide()
	
func showBig():
	BigInfo.show()
	
func showSmall():
	SmallInfo.show()
