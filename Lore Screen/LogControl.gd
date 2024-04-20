extends Panel

var Play : Button
var Pause : Button
var Status : Panel
var StatusLabel : Label
var FileName : Label
var Subtitle : Label
var LoreScreen : Node2D

@export
var index : int

# Called when the node enters the scene tree for the first time.
func _ready():
	Status = $Status
	Play = $Play
	Pause = $Pause
	StatusLabel = $Status/Label
	FileName = $Label
	$Subtitle.visible = false
	LoreScreen = get_parent()

func ShowText(check : bool):
	$Subtitle.visible = check

func on_play_button_pressed():
	GlobalVariables.CurrentLog = index
	LoreScreen.on_Play_pressed()
	

func Lock():
	Play.disabled = true
	Pause.disabled = true
	Status.modulate = Color(1, 0, 0) # Red
	StatusLabel.text = "LOCKED"
	
func Unlock(name : String):
	Play.disabled = false
	Pause.disabled = false
	Status.modulate = Color(0, 1, 0) # Red
	StatusLabel.text = "UNLOCKED"
	FileName.text = name
