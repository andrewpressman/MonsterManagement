extends AudioStreamPlayer2D

func play_sound(parameter_value: int):
	# Add your conditions to determine which sound to play based on the parameter_value
	match parameter_value:
		1:
			#Group Ping Sound
			stream = preload("res://Assets/Audio Files/Actions Sounds/Ping.wav")
			volume_db = 1
			play()
		2:
			# Power Up
			stream = preload("res://Assets/Audio Files/Actions Sounds/powerUp.wav")
			volume_db = 1
			play()
		3:
			# Power Down
			stream = preload("res://Assets/Audio Files/Actions Sounds/powerDown.wav")
			volume_db = 1
			play()
		4:
			#agitate
			stream = preload("res://Assets/Audio Files/Actions Sounds/electric-buzz-shock.mp3")
			volume_db = 0
			play()
		5:
			#shock
			stream = preload("res://Assets/Audio Files/Actions Sounds/electric-buzz-shock.mp3")
			volume_db = 1
			play()
		6:
			#enrage
			stream = preload("res://Assets/Audio Files/Actions Sounds/electric-buzz-shock.mp3")
			volume_db = 2
			play()
		7:
			# Single Ping Sound
			stream = preload("res://Assets/Audio Files/Actions Sounds/SinglePing.wav")
			volume_db = 1
			play()
		8:
			# Calm monster sound
			stream = preload("res://Assets/Audio Files/Actions Sounds/Roar.wav")
			volume_db = 1
			play()
		# Add more cases as needed
