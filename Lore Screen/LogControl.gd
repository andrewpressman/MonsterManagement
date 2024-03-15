extends Panel

var Play : Button
var Pause : Button
var Restart : Button
var Player : AudioStreamPlayer2D
var Status : Panel
var StatusLabel : Label
var Timestamp

# Called when the node enters the scene tree for the first time.
func _ready():
	Status = $Status
	Player = $Log
	Play = $Play
	Pause = $Pause
	Restart = $Restart
	StatusLabel = $Status/Label
	Timestamp = Player.get_playback_position()

func _on_PlayButton_pressed():
	# Play the audio
	Player.play(Timestamp)

func _on_PauseButton_pressed():
	# Pause the audio
	Timestamp = Player.get_playback_position()
	Player.stop()

func _on_RestartButton_pressed():
	# Seek to the beginning and play the audio
	Player.stop()

func Lock():
	Play.disabled = true
	Play.focus_mode = Control.FOCUS_NONE
	Pause.disabled = true
	Pause.focus_mode = Control.FOCUS_NONE
	Restart.disabled = true
	Restart.focus_mode = Control.FOCUS_NONE
	Status.modulate = Color(1, 0, 0) # Red
	StatusLabel.text = "LOCKED"
	
func Unlock():
	Play.disabled = true
	Play.focus_mode = Control.FOCUS_ALL
	Pause.disabled = true
	Pause.focus_mode = Control.FOCUS_ALL
	Restart.disabled = true
	Restart.focus_mode = Control.FOCUS_ALL
	Status.modulate = Color(0, 1, 0) # Red
	StatusLabel.text = "UNLOCKED"
