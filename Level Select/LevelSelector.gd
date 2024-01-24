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
		
	SetStatus()
	SetLevel()

	NextLevel = $NextLevel
	if AllComplete:
		if GlobalVariables.CurrentLevel >= 15:
			$NextLevel/Label.text = "A winner is you."
			GlobalVariables.CurrentLevel += 1
			$NextLevel/Continue.hide()
		NextLevel.show()
	else:
		NextLevel.hide()
	
	#testing
	LastScore = $TempScore/Score
	if GlobalVariables.Score == null:
		GlobalVariables.Score = 0
	var score = GlobalVariables.Score
	LastScore.text = "Last score: " + str(score)

func SetLevel():
	CurrentLevel.text = "Current Case: " + str(GlobalVariables.CurrentLevel)

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
#TODO: move difficulty settings and make it scale with level
func _on_begin_button_pressed():
	if selectedButton == Level1Button:
		GlobalVariables.CurrentStage = 1
		GetLevel()
		GlobalVariables.TargetScore = 10
		
	if selectedButton == Level2Button:
		GlobalVariables.CurrentStage = 2
		GetLevel()
		GlobalVariables.TargetScore = 10
		
	if selectedButton == Level3Button:
		GlobalVariables.CurrentStage = 3
		GetLevel()
		GlobalVariables.TargetScore = 10
	# Reset the button selection
	unselectButtions(true)
	StartGame()

func GetLevel():
	if GlobalVariables.CurrentLevel <= 3:
		setDifficulty(40,80,300,5,-2) #TODO: make easier
	
	elif GlobalVariables.CurrentLevel <= 6:
		setDifficulty(20,60,120,5,-1) #main difficulty (BALANCED)
	
	elif GlobalVariables.CurrentLevel <= 9:
		setDifficulty(20,60,120,5,-1) #TODO: make harder
	
	elif GlobalVariables.CurrentLevel <= 12:
		setDifficulty(20,60,120,5,-1) #TODO: make harder
	
	else:
		setDifficulty(10,50,100,4,-1) #TODO: make hardest

#sets game difficulty
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
	SetStatus()
	GlobalVariables.CurrentLevel += 7
	SetLevel()
	NextLevel.hide()

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
	Level1.showSmall()
	Level2.showSmall()
	Level3.showSmall()

func hideSmall():
	Level1.hideSmall()
	Level2.hideSmall()
	Level3.hideSmall()

func hideBig():
	Level1.hideBig()
	Level2.hideBig()
	Level3.hideBig()

func ReturnToMenu():
	get_tree().change_scene_to_file("res://Home Screen/MainMenu.tscn")

#switch to game screen
func StartGame():
	#pass in parameters for game
	get_tree().change_scene_to_file("res://Game Screen.tscn")
