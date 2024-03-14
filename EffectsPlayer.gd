extends AudioStreamPlayer2D

func play_sound(parameter_value: int):
	match parameter_value:
		1:
			#Group Ping Sound
			stream = preload("res://Assets/Audio Files/Actions Sounds/Ping.wav")
			play()
		2:
			# Power Up
			stream = preload("res://Assets/Audio Files/Actions Sounds/powerUp.wav")
			play()
		3:
			# Power Down
			stream = preload("res://Assets/Audio Files/Actions Sounds/powerDown.wav")
			play()
		4:
			#agitate
			stream = preload("res://Assets/Audio Files/Actions Sounds/electric-buzz-shock.mp3")
			play()
		5:
			#shock
			stream = preload("res://Assets/Audio Files/Actions Sounds/electric-buzz-shock.mp3")
			play()
		6:
			#enrage
			stream = preload("res://Assets/Audio Files/Actions Sounds/electric-buzz-shock.mp3")
			play()
		7:
			# Single Ping Sound
			stream = preload("res://Assets/Audio Files/Actions Sounds/SinglePing.wav")
			play()
		8:
			# Calm monster sound
			stream = preload("res://Assets/Audio Files/Actions Sounds/Roar.wav")
			play()
		# Add more cases as needed
