extends AudioStreamPlayer2D

func play_message(parameter_value: int):
	# Add your conditions to determine which sound to play based on the parameter_value
	match parameter_value:
		1:
			#Introduction log
			#stream = preload("res://Assets/Audio Files/SupervisorLogs/Ping.wav")
			play()
		2:
			#Level 2 message
			#stream = preload("res://Assets/Audio Files/SupervisorLogs/powerUp.wav")
			play()
		3:
			#Level 3 message
			#stream = preload("res://Assets/Audio Files/SupervisorLogs/powerDown.wav")
			play()
		4:
			#Level 4 message
			#stream = preload("res://Assets/Audio Files/SupervisorLogs/electric-buzz-shock.mp3")
			play()
		5:
			#Level 5 message
			#stream = preload("res://Assets/Audio Files/SupervisorLogs/electric-buzz-shock.mp3")
			play()
		6:
			#Level 5 success message
			#stream = preload("res://Assets/Audio Files/SupervisorLogs/electric-buzz-shock.mp3")
			play()
		7:
			#Level 5 fail passed
			#stream = preload("res://Assets/Audio Files/SupervisorLogs/SinglePing.wav")
			play()

		# Add more cases as needed
