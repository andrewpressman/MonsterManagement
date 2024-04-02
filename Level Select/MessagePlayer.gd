extends AudioStreamPlayer2D

func play_message(parameter_value: int):
	# Add your conditions to determine which sound to play based on the parameter_value
	match parameter_value:
		1:
			#Introduction log
			stream = preload("res://Assets/Audio Files/SupervisorLogs/Message1.wav")
			play()
		2:
			#Level 2 message
			stream = preload("res://Assets/Audio Files/SupervisorLogs/Message2.wav")
			play()
		3:
			#Level 3 message
			stream = preload("res://Assets/Audio Files/SupervisorLogs/Message3.wav")
			play()
		4:
			#Level 4 static
			#stream = preload("")
			play()
		5:
			#Level 5 robotic message
			stream = preload("res://Assets/Audio Files/MachineVoice/Message5.wav")
			play()
		6:
			#Level 5 success message
			stream = preload("res://Assets/Audio Files/MachineVoice/ObjectiveComplete.wav")
			play()
		7:
			#Level 5 fail passed
			stream = preload("res://Assets/Audio Files/MachineVoice/ObjectiveFailed.wav")
			play()

		# Add more cases as needed
