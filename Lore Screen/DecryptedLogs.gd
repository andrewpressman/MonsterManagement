extends AudioStreamPlayer2D

var LoreScreen : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	LoreScreen = get_parent()


func play_message(parameter_value: int):
	# Add your conditions to determine which sound to play based on the parameter_value
	match parameter_value:
		1:
			stream = preload("res://Assets/Audio Files/BonusLogs/Nexus_Marketing.wav")
			play()
		2:
			#stream = preload("res://Assets/Audio Files/SupervisorLogs/Message2.wav")	
			play()
		3:
			#stream = preload("res://Assets/Audio Files/SupervisorLogs/Message3.wav")
			play()
		4:
			#stream = preload("res://Assets/Audio Files/MachineVoice/StaticSound.wav")
			play()
		5:
			#stream = preload("res://Assets/Audio Files/MachineVoice/Message5.wav")
			play()
		6:
			#stream = preload("res://Assets/Audio Files/MachineVoice/ObjectiveComplete.wav")
			play()
		7:
			#stream = preload("res://Assets/Audio Files/MachineVoice/ObjectiveFailed.wav")
			play()
		8:
			#stream = preload("res://Assets/Audio Files/MachineVoice/ObjectiveFailed.wav")
			play()
		9:
			#stream = preload("res://Assets/Audio Files/MachineVoice/ObjectiveFailed.wav")
			play()
			
func pause_message():
	LoreScreen.hideAll()
	stop()
