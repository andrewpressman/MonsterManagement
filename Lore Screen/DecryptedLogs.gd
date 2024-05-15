extends AudioStreamPlayer2D

var LoreScreen : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	LoreScreen = get_parent()


func play_message(parameter_value: int):
	# Add your conditions to determine which sound to play based on the parameter_value
	parameter_value += 1
	match parameter_value:
		1:
			stream = preload("res://Assets/Audio Files/BonusLogs/Nexus_Marketing.wav")
			play()
		2:
			stream = preload("res://Assets/Audio Files/BonusLogs/Encrypted1.wav")	
			play()
		3:
			stream = preload("res://Assets/Audio Files/BonusLogs/Encrypted2.wav")	
			play()
		4:
			stream = preload("res://Assets/Audio Files/BonusLogs/Encrypted3.wav")	
			play()
		5:
			stream = preload("res://Assets/Audio Files/BonusLogs/Encrypted4.wav")	
			play()
		6:
			stream = preload("res://Assets/Audio Files/BonusLogs/Encrypted5.wav")	
			play()
		7:
			stream = preload("res://Assets/Audio Files/BonusLogs/Encrypted6.wav")	
			play()
		8:
			stream = preload("res://Assets/Audio Files/BonusLogs/Encrypted7.wav")	
			play()
		9:
			stream = preload("res://Assets/Audio Files/BonusLogs/EncryptedFinal.wav")	
			play()
			
func pause_message():
	LoreScreen.hideAll()
	stop()
