extends Node

var Select : Button
var SmallInfo : Panel
var BigInfo : Panel
var Status : Panel

var isPanelExpanded : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	SmallInfo = $MiniInfo
	BigInfo = $BigInfo
	Status = $Status
	BigInfo.hide()

func hideBig():
	BigInfo.hide()
	
func hideSmall():
	SmallInfo.hide()
	
func showBig():
	BigInfo.show()
	
func showSmall():
	SmallInfo.show()

func MarkCompete():
	Status.modulate = Color(0, 1, 0) # green
	
func MarkIncomplete():
	Status.modulate = Color(1, 0, 0) # Red
