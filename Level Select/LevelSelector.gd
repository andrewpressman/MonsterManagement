extends Node2D

var GameController: Node2D

#Monster Controls
var Level1Button: Button
var Level2Button: Button
var Level3Button: Button

var Level1
var Level2
var Level3

var executeButton: Button

var selectedButton: Button  # Stores the currently selected button

#NextLevel Variables
var NextLevel : Panel
var Continue : Button
var AllComplete : bool

#testing
var LastScore : Label

#LevelControls
var CurrentLevel : Label
var Exit : Button

func _ready():
	Save()
	Level1Button = $Cases/Level1/select
	Level2Button = $Cases/Level2/select
	Level3Button = $Cases/Level3/select
	GlobalVariables.IncreaseRate = GlobalVariables.StartRate
	GlobalVariables.TargetScore = 0
	Level1 = $Cases/Level1
	Level2 = $Cases/Level2
	Level3 = $Cases/Level3
	
	CurrentLevel = $"Level Tracker/Label"
	
	Exit = $Exit
	
	executeButton = $Begin
	selectedButton = null
	executeButton.disabled = true
	
	$"Level Tracker".visible = false
	$Exit.visible = false
	$StatusGuide.visible = false
	$Cases.visible = false
	$MessagePanel.visible = false
	$Begin.visible = false
	$DecryptedData.visible = false
	
	SetStatus()

	NextLevel = $NextLevel
	if AllComplete:
		if GlobalVariables.CurrentLevel >= 5:
			$NextLevel/Label.text = "A winner is you."
			GlobalVariables.CurrentLevel += 1
			$NextLevel/Continue.hide()
		NextLevel.show()
	else:
		NextLevel.hide()
	
	#Save for endless mode
	#LastScore = $TempScore/Score
	#if GlobalVariables.Score == null:
	#	GlobalVariables.Score = 0
	#var score = GlobalVariables.Score
	#LastScore.text = "Last score: " + str(score)
	Startup()

func Startup():
	$"Level Tracker".visible = true
	$Exit.visible = true
	$StatusGuide.visible = true
	await get_tree().create_timer(.3).timeout
	$Cases.visible = true
	await get_tree().create_timer(.3).timeout
	SetLevel()
	await get_tree().create_timer(.3).timeout
	$MessagePanel.visible = true
	await get_tree().create_timer(.3).timeout
	$Begin.visible = true
	await get_tree().create_timer(.3).timeout
	if GlobalVariables.CurrentLevel > 1:
		$DecryptedData.visible = true
	else:
		$DecryptedData.visible = false

func SetLevel():
	
	CurrentLevel.text = "Current Case: " + str(GlobalVariables.CurrentLevel)
	if GlobalVariables.CurrentLevel == 1 || GlobalVariables.CurrentLevel == 5:
		#Level 1 and 3 are hidden and thus marked as fully complete
		GlobalVariables.Level2Status = 2
		GlobalVariables.Level3Status = 2
		Level1.Startup()
	else:
		Level1.Startup()
		Level2.Startup()
		Level3.Startup()

#markes a level complete
func SetStatus():
	AllComplete = true
	if GlobalVariables.Level1Status > 0:
		Level1.MarkComplete(GlobalVariables.Level1Status)
	else:
		Level1.MarkIncomplete()
		AllComplete = false
	
	if GlobalVariables.Level2Status > 0:
		Level2.MarkComplete(GlobalVariables.Level2Status)
	else:
		Level2.MarkIncomplete()
		AllComplete = false
	
	if GlobalVariables.Level3Status > 0:
		Level3.MarkComplete(GlobalVariables.Level3Status)
	else:
		Level3.MarkIncomplete()
		AllComplete = false

# Function to update the button selection and visuals
func update_button_selection(button: Button):
	executeButton.disabled = false
	selectedButton = button
	selectedButton.modulate = Color(0, 1, 0)  # Set selected button to green
	unselectButtions(false)

#unselects all buttons
func unselectButtions(clear:bool):
	if clear:
		selectedButton = null
		executeButton.disabled = true
	hideBig()
	ShowSmall()
	for button in [Level1Button, Level2Button, Level3Button]:
		if button != selectedButton:
			button.modulate = Color(1, 1, 1)  # Reset color

func _on_Level1_pressed():
	if selectedButton == Level1Button:
		unselectButtions(true)
	else:
		update_button_selection(Level1Button)
		showBig(1)
	
func _on_Level2_pressed():
	if selectedButton == Level2Button:
		unselectButtions(true)
	else:
		update_button_selection(Level2Button)
		showBig(2)
	
func _on_Level3_pressed():
	if selectedButton == Level3Button:
		unselectButtions(true)
	else:
		update_button_selection(Level3Button)
		showBig(3)

#starts game and sets difficulty
func _on_begin_button_pressed():
	if selectedButton == Level1Button:
		GlobalVariables.CurrentStage = 1
		GetLevel()
		GlobalVariables.TargetScore = 1000 * GlobalVariables.CurrentLevel
		
	if selectedButton == Level2Button:
		GlobalVariables.CurrentStage = 2
		GetLevel()
		GlobalVariables.TargetScore = 1000 * GlobalVariables.CurrentLevel
		
	if selectedButton == Level3Button:
		GlobalVariables.CurrentStage = 3
		GetLevel()
		GlobalVariables.TargetScore = 1000 * GlobalVariables.CurrentLevel
	# Reset the button selection
	unselectButtions(true)
	StartGame()

func GetLevel():
	if GlobalVariables.CurrentLevel == 1:
		setDifficulty(20,60,120,2,-2)
	
	elif GlobalVariables.CurrentLevel == 2:
		setDifficulty(20,50,100,2,-1) 
	
	elif GlobalVariables.CurrentLevel == 3:
		setDifficulty(10,60,120,3,-1)
	
	elif GlobalVariables.CurrentLevel == 4:
		setDifficulty(10,40,100,4,-1)
	
	elif GlobalVariables.CurrentLevel == 5:
		setDifficulty(5,20,100,4,-1)

#sets game difficulty (yellow, red, black, increaseRate, DecreaseRate)
func setDifficulty(yellow:int, red:int, maxVal:int, INC:int, DEC:int):
	GlobalVariables.YellowThreshold = yellow
	GlobalVariables.RedThreshold = red
	GlobalVariables.MaxState = maxVal
 
	GlobalVariables.IncreaseRate = INC
	GlobalVariables.DecreaseRate = DEC
		

#reset values and proceed to next level
func Reset():
	GlobalVariables.Level1Status = 0
	GlobalVariables.Level2Status = 0
	GlobalVariables.Level3Status = 0
	GlobalVariables.MessagePlayed = false
	SetStatus()
	if GlobalVariables.CurrentLevel < 5:
		GlobalVariables.CurrentLevel += 1
	SetLevel()
	NextLevel.hide()
	get_tree().change_scene_to_file("res://Level Select/Level Select Screen.tscn")
	
#show selected bigInfo
func showBig(button : int):
	hideSmall()
	match button:
		1:
			Level1.showBig()
			Level2.hideBig()
			Level3.hideBig()
		2:
			Level2.showBig()
			Level1.hideBig()
			Level3.hideBig()
		3:
			Level3.showBig()
			Level1.hideBig()
			Level2.hideBig()

func ShowSmall():
	if GlobalVariables.CurrentLevel == 1 || GlobalVariables.CurrentLevel == 5:
		Level1.showSmall()
	else:
		Level1.showSmall()
		Level2.showSmall()
		Level3.showSmall()

func hideSmall():
	if GlobalVariables.CurrentLevel == 1 || GlobalVariables.CurrentLevel == 5:
		Level1.hideSmall()
	else:
		Level1.hideSmall()
		Level2.hideSmall()
		Level3.hideSmall()

func hideBig():
	if GlobalVariables.CurrentLevel == 1 || GlobalVariables.CurrentLevel == 5:
		Level1.hideBig()
	else:
		Level1.hideBig()
		Level2.hideBig()
		Level3.hideBig()

func GoToLore():
	get_tree().change_scene_to_file("res://Lore Screen/LoreScreen.tscn")

func ReturnToMenu():
	get_tree().change_scene_to_file("res://Home Screen/MainMenu.tscn")

#switch to game screen
func StartGame():
	#pass in parameters for game
	get_tree().change_scene_to_file("res://Game Screen.tscn")
	
func Save():
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var save_data = {
		"YellowThreshold" : GlobalVariables.YellowThreshold,
		"RedThreshold" : GlobalVariables.RedThreshold,
		"MaxState" : GlobalVariables.MaxState,
		"StartRate" : GlobalVariables.StartRate,
		"IncreaseRate" : GlobalVariables.IncreaseRate,
		"DecreaseRate" : GlobalVariables.DecreaseRate,
		"Score" : GlobalVariables.Score,
		"TargetScore" : GlobalVariables.TargetScore,
		"CurrentLevel" : GlobalVariables.CurrentLevel,
		"Level1Status" : GlobalVariables.Level1Status,
		"Level2Status" : GlobalVariables.Level2Status,
		"Level3Status" : GlobalVariables.Level3Status,
		"GameStarted" : GlobalVariables.GameStarted,
		"GlobalVolume" : GlobalVariables.GlobalAudio,
		"DialogueVolume" : GlobalVariables.Dialogue,
		"ActionsVolume" : GlobalVariables.Actions,
		"AmbienceVolume" : GlobalVariables.Ambience,
		"DisplayMode" : GlobalVariables.DisplayMode,
		"UnlockedLogs" : GlobalVariables.UnlockedLogs
	}
	var json_str = JSON.stringify(save_data)
	save_game.store_line(json_str)
	
