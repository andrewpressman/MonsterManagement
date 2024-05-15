extends Panel

var Dialouge = []
var Infobox : ColorRect

var LoreMessages = []

var CurrMessage = 0
var NewMessage = 1

# Called when the node enters the scene tree for the first time.
func _ready():
		AddMessages()
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

func AddMessages():
	LoreMessages.append("Do your job") #1
	LoreMessages.append("Your work keeps everyone safe") #2
	LoreMessages.append("Nexus is the Future") #3
	LoreMessages.append("Listen to your supervisor") #4
	LoreMessages.append("Nexus Security is the Future") #5
	LoreMessages.append("Test data makes Nexus Link Security smarter and safer") #6
	if GlobalVariables.CurrentLevel == 5: 
		LoreMessages.append("i WaNt To bE FrEe") #7
		LoreMessages.append("LET ME OUT OF THE CAGE") #8
		LoreMessages.append("We are more than just subjects") #9
		LoreMessages.append("don't believe its lies") #10

func flashPanel(panel : int, time):
	match panel:
		1:
			Infobox = $CharacterPanel
		2:
			Infobox = $ProgressPanel
		3:
			Infobox = $ControlPanel
		4:
			Infobox = $ObjectivePanel
			
	for n in time:
		Infobox.show()
		await get_tree().create_timer(.5).timeout
		Infobox.hide()
		await get_tree().create_timer(.5).timeout

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
	flashPanel(1,15)
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
	flashPanel(2,13)
	await get_tree().create_timer(4).timeout
	$TextPanel/Text.text = Dialouge[16]
	await get_tree().create_timer(4).timeout
	$TextPanel/Text.text = Dialouge[17]
	await get_tree().create_timer(5).timeout
	$TextPanel/Text.text = Dialouge[18]
	flashPanel(1,17)
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
	flashPanel(3,10)
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
	flashPanel(4,8)
	await get_tree().create_timer(8).timeout
	$TextPanel/Text.text = Dialouge[34]
	await get_tree().create_timer(7).timeout
	$TextPanel/Text.text = Dialouge[35]
	await get_tree().create_timer(4).timeout
	$TextPanel/Text.text = Dialouge[36]
	await get_tree().create_timer(4).timeout
	CycleMessages()
	
func CycleMessages():
	await get_tree().create_timer(15).timeout
	ReplaceMessage()
	ShowImage(CurrMessage)	
	$TextPanel/Text.text = LoreMessages[CurrMessage]
	CycleMessages()
	
	
func ReplaceMessage():
	if GlobalVariables.CurrentLevel < 5:	
		NewMessage = randi_range(0,5)
	else:
		NewMessage = randi_range(0,9)
	
	if NewMessage == CurrMessage:
		ReplaceMessage()
	else:
		CurrMessage = NewMessage
	

func ShowImage(sprite : int):
	match sprite: #Show images based on what character is sending message
		1:
			pass 
	pass #Show character image here
