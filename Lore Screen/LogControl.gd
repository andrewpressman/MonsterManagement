extends Panel

var Play : Button
var Pause : Button
var Player : AudioStreamPlayer2D
var Status : Panel
var StatusLabel : Label
var FileName : Label
var Timestamp

# Called when the node enters the scene tree for the first time.
func _ready():
	Status = $Status
	Player = $Log
	Play = $Play
	Pause = $Pause
	StatusLabel = $Status/Label
	FileName = $Label
	$Text.visible = false

func _on_PlayButton_pressed():
	# Play the audio
	Player.play(Timestamp)
	$Text.visible = true

func _on_PauseButton_pressed():
	# stop the audio
	Player.stop()
	$Text.visible = false

func Lock():
	Play.disabled = true
	Play.focus_mode = Control.FOCUS_NONE
	Pause.disabled = true
	Pause.focus_mode = Control.FOCUS_NONE
	Status.modulate = Color(1, 0, 0) # Red
	StatusLabel.text = "LOCKED"
	
func Unlock(name : String):
	Play.disabled = true
	Play.focus_mode = Control.FOCUS_ALL
	Pause.disabled = true
	Pause.focus_mode = Control.FOCUS_ALL
	Status.modulate = Color(0, 1, 0) # Red
	StatusLabel.text = "UNLOCKED"
	FileName.text = name
