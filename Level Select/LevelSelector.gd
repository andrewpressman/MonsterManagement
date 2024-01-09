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

#testing
var LastScore : Label

func _ready():
	Level1Button = $Cases/Level1/select
	Level2Button = $Cases/Level2/select
	Level3Button = $Cases/Level3/select
	GlobalVariables.IncreaseRate = GlobalVariables.StartRate
	GlobalVariables.TargetScore = 0
	Level1 = $Cases/Level1
	Level2 = $Cases/Level2
	Level3 = $Cases/Level3
	
	executeButton = $Begin
	selectedButton = null
	executeButton.disabled = true
	
	#testing
	LastScore = $TempScore/Score
	if GlobalVariables.Score == null:
		GlobalVariables.Score = 0
	var score = GlobalVariables.Score
	LastScore.text = "Last score: " + str(score)
	
func SetStatus():
	if GlobalVariables.Level1Status == 1:
		Level1.MarkComplete()
	else:
		Level1.MarkIncomplete()
	if GlobalVariables.Level1Status == 1:
		Level2.MarkComplete()
	else:
		Level2.MarkIncomplete()
	if GlobalVariables.Level1Status == 1:
		Level3.MarkComplete()
	else:
		Level3.MarkIncomplete()


# Function to update the button selection and visuals
func update_button_selection(button: Button):
	executeButton.disabled = false
	selectedButton = button
	selectedButton.modulate = Color(0, 1, 0)  # Set selected button to green
	unselectButtions(false)

func unselectButtions(clear:bool):
	if clear:
		selectedButton = null
		executeButton.disabled = true
	hideBig()
	ShowSmall()
	for button in [Level1Button, Level2Button, Level3Button]:
		if button != selectedButton:
			button.modulate = Color(1, 1, 1)  # Reset color

#TODO: properly show/hide info panels
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

func _on_begin_button_pressed():
	if selectedButton == Level1Button:
		GlobalVariables.CurrentStage = 1
		setDifficulty(30,60,90,10,-10)
		GlobalVariables.TargetScore = 1000
		
	if selectedButton == Level2Button:
		GlobalVariables.CurrentStage = 2
		setDifficulty(20,60,120,5,-1)
		GlobalVariables.TargetScore = 1000
		
	if selectedButton == Level3Button:
		GlobalVariables.CurrentStage = 3
		setDifficulty(50,80,100,10,-1)
		GlobalVariables.TargetScore = 1000
	# Reset the button selection
	unselectButtions(true)
	StartGame()

func setDifficulty(yellow:int, red:int, maxVal:int, INC:int, DEC:int):
	GlobalVariables.YellowThreshold = yellow
	GlobalVariables.RedThreshold = red
	GlobalVariables.MaxState = maxVal
 
	GlobalVariables.IncreaseRate = INC
	GlobalVariables.DecreaseRate = DEC
		

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

func StartGame():
	#pass in parameters for game
	get_tree().change_scene_to_file("res://Game Screen.tscn")
