extends Panel

var Dialouge = []

# Called when the node enters the scene tree for the first time.
func _ready():
		if GlobalVariables.CurrentLevel == 1:
			var file = FileAccess.open("res://Assets/Audio Files/Tutorial.txt", FileAccess.READ)
			var content = file.get_as_text()
			while !file.eof_reached():
				var line = file.get_line()
				Dialouge.append(line)
			file.close()
			$Tutorial.play()
			Subtitles()
		else:
			CycleMessages()
			

func Subtitles():
	await get_tree().create_timer(1).timeout
	$TextPanel/Text.text = Dialouge[0]
	await get_tree().create_timer(5).timeout
	$TextPanel/Text.text = Dialouge[1]
	await get_tree().create_timer(3).timeout
	$TextPanel/Text.text = Dialouge[2]
	await get_tree().create_timer(3).timeout
	$TextPanel/Text.text = Dialouge[3]
	await get_tree().create_timer(4).timeout
	$TextPanel/Text.text = Dialouge[4]
	await get_tree().create_timer(3).timeout
	$TextPanel/Text.text = Dialouge[5]
	await get_tree().create_timer(5).timeout
	$TextPanel/Text.text = Dialouge[6]
	await get_tree().create_timer(3).timeout
	$TextPanel/Text.text = Dialouge[7]
	await get_tree().create_timer(5.5).timeout
	$TextPanel/Text.text = Dialouge[8]
	await get_tree().create_timer(4.5).timeout
	$TextPanel/Text.text = Dialouge[9]
	await get_tree().create_timer(5.5).timeout
	$TextPanel/Text.text = Dialouge[10]
	await get_tree().create_timer(3.5).timeout
	$TextPanel/Text.text = Dialouge[11]
	await get_tree().create_timer(7).timeout 
	$TextPanel/Text.text = Dialouge[12]
	await get_tree().create_timer(6).timeout
	$TextPanel/Text.text = Dialouge[13]
	await get_tree().create_timer(5).timeout
	$TextPanel/Text.text = Dialouge[14]
	await get_tree().create_timer(6).timeout
	$TextPanel/Text.text = Dialouge[15]
	await get_tree().create_timer(4).timeout
	$TextPanel/Text.text = Dialouge[16]
	await get_tree().create_timer(4).timeout
	$TextPanel/Text.text = Dialouge[17]
	await get_tree().create_timer(5).timeout
	$TextPanel/Text.text = Dialouge[18]
	await get_tree().create_timer(4).timeout
	$TextPanel/Text.text = Dialouge[19]
	await get_tree().create_timer(5).timeout
	$TextPanel/Text.text = Dialouge[20]
	await get_tree().create_timer(4).timeout
	$TextPanel/Text.text = Dialouge[21]
	await get_tree().create_timer(4).timeout
	$TextPanel/Text.text = Dialouge[22]
	await get_tree().create_timer(3).timeout
	$TextPanel/Text.text = Dialouge[23]
	await get_tree().create_timer(8).timeout
	$TextPanel/Text.text = Dialouge[24]
	await get_tree().create_timer(4).timeout
	$TextPanel/Text.text = Dialouge[25]
	await get_tree().create_timer(3).timeout
	$TextPanel/Text.text = Dialouge[26]
	await get_tree().create_timer(7).timeout
	$TextPanel/Text.text = Dialouge[27]
	await get_tree().create_timer(2).timeout
	$TextPanel/Text.text = Dialouge[28]
	await get_tree().create_timer(5).timeout
	$TextPanel/Text.text = Dialouge[29]
	await get_tree().create_timer(3).timeout
	$TextPanel/Text.text = Dialouge[30]
	await get_tree().create_timer(4).timeout
	$TextPanel/Text.text = Dialouge[31]
	await get_tree().create_timer(4).timeout
	$TextPanel/Text.text = Dialouge[32]
	await get_tree().create_timer(6).timeout
	$TextPanel/Text.text = Dialouge[33]
	await get_tree().create_timer(8).timeout
	$TextPanel/Text.text = Dialouge[34]
	await get_tree().create_timer(7).timeout
	$TextPanel/Text.text = Dialouge[35]
	await get_tree().create_timer(4).timeout
	$TextPanel/Text.text = Dialouge[36]
	
func CycleMessages():
	$TextPanel/Text.text = " "
	
