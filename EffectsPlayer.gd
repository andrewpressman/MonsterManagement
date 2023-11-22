extends AudioStreamPlayer2D

func play_sound(parameter_value: int):
	# Add your conditions to determine which sound to play based on the parameter_value
	match parameter_value:
		1:
			# Ping Sound
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
			
		# Add more cases as needed
