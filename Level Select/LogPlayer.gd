extends AudioStreamPlayer2D

func play_message(parameter_value: int):
	# Add your conditions to determine which sound to play based on the parameter_value
	match parameter_value:
		1:
			#Introduction log
			#stream = preload("res://Assets/Audio Files/Actions Sounds/Ping.wav")
			play()
		2:
			#If Level 1 test is complete
			#stream = preload("res://Assets/Audio Files/Actions Sounds/powerUp.wav")
			play()
		3:
			#If level 1 test fails
			#stream = preload("res://Assets/Audio Files/Actions Sounds/powerDown.wav")
			play()
		4:
			#Level 2 message
			#stream = preload("res://Assets/Audio Files/Actions Sounds/electric-buzz-shock.mp3")
			play()
		5:
			#Level 3 message
			#stream = preload("res://Assets/Audio Files/Actions Sounds/electric-buzz-shock.mp3")
			play()
		6:
			#Level 4 message
			#stream = preload("res://Assets/Audio Files/Actions Sounds/electric-buzz-shock.mp3")
			play()
		7:
			#Level 5 message
			#stream = preload("res://Assets/Audio Files/Actions Sounds/SinglePing.wav")
			play()

		# Add more cases as needed
