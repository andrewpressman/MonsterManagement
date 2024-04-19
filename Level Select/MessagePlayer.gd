extends AudioStreamPlayer2D

var Dialouge = []
	
func _ready():
	$Subtitles.visible = false
	if GlobalVariables.Subtitles == true:
		var file = FileAccess.open("res://Assets/Audio Files/LevelSubtitles.txt", FileAccess.READ)
		var content = file.get_as_text()
		while !file.eof_reached():
			var line = file.get_line()
			Dialouge.append(line)
		file.close()

func play_message(parameter_value: int):
	# Add your conditions to determine which sound to play based on the parameter_value
	match parameter_value:
		1:
			#Introduction log
			stream = preload("res://Assets/Audio Files/SupervisorLogs/Message1.wav")
			if GlobalVariables.Subtitles == true:
				DisplaySubtitles(0,25)
			play()
		2:
			#Level 2 message
			stream = preload("res://Assets/Audio Files/SupervisorLogs/Message2.wav")
			if GlobalVariables.Subtitles == true:
				DisplaySubtitles(27,42)			
			play()
		3:
			#Level 3 message
			stream = preload("res://Assets/Audio Files/SupervisorLogs/Message3.wav")
			if GlobalVariables.Subtitles == true:
				DisplaySubtitles(44,55)
			play()
		4:
			#Level 4 static
			stream = preload("res://Assets/Audio Files/MachineVoice/StaticSound.wav")
			if GlobalVariables.Subtitles == true:
				DisplaySubtitles(41,51)
			play()
		5:
			#Level 5 robotic message
			stream = preload("res://Assets/Audio Files/MachineVoice/Message5.wav")
			if GlobalVariables.Subtitles == true:
				DisplaySubtitles(57,57)
			play()
		6:
			#Level 5 success message
			stream = preload("res://Assets/Audio Files/MachineVoice/ObjectiveComplete.wav")
			if GlobalVariables.Subtitles == true:
				DisplaySubtitles(66,68)
			play()
		7:
			#Level 5 fail passed
			stream = preload("res://Assets/Audio Files/MachineVoice/ObjectiveFailed.wav")
			if GlobalVariables.Subtitles == true:
				DisplaySubtitles(68,68)
			play()

func DisplaySubtitles(first : int, last : int):
	$Subtitles.visible = true
	for line in range(first,last):
		$Subtitles/Label.text = Dialouge[line]
		await get_tree().create_timer(4.5).timeout
	
	$Subtitles.visible = false
