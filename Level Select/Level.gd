extends Node

@export
var Stage : int

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
	Select = $select
	BigInfo.hide()

func hideBig():
	BigInfo.hide()
	
func hideSmall():
	SmallInfo.hide()
	
func showBig():
	BigInfo.show()
	
func showSmall():
	SmallInfo.show()

func hideAll():
	Select.hide()
	SmallInfo.hide()
	BigInfo.hide()
	Status.hide()

func MarkComplete(option: int):
	if option == 1:
		Status.modulate = Color(.5, .5, 0) # yellow
	if option == 2:
		Status.modulate = Color(0, .5, 0) # green
		UpdateLogs()

#Update which logs are unlocked
func UpdateLogs():
	var Level = GlobalVariables.CurrentLevel
	var index : int
	if Level > 1:
		index = ((3 * Level) + Stage) - 7
		GlobalVariables.UnlockedLogs[index] = 1
	
func MarkIncomplete():
	Status.modulate = Color(.5, 0, 0) # Red
