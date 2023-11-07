extends Panel

var audio_player : AudioStreamPlayer2D
var timestamp

func _ready():
	# Find the AudioStreamPlayer node in the scene
	audio_player = get_node("/root/Node2D/AudioPlayer")
	timestamp = audio_player.get_playback_position()
	
func _on_PlayButton_pressed():
	# Play the audio
	audio_player.play(timestamp)

func _on_PauseButton_pressed():
	# Pause the audio
	timestamp = audio_player.get_playback_position()
	audio_player.stop()

func _on_RestartButton_pressed():
	# Seek to the beginning and play the audio
	audio_player.stop()
	audio_player.play()
