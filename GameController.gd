extends Node2D

#goals: Keep characters in Scared State, Don't let Monster Escape
var MinState : int
var YellowThreshold : int
var RedThreshold : int
var MaxState : int

var IncreaseRate : int
var DecreaseRate : int

# calm, scared, panic dead
var Character1 : int
var Character2 : int
var Character3 : int

# inactive, active, angry, escaped
var Monster : int

#Audio Settings
var EffectsPlayer : AudioStreamPlayer2D

#info panel
var LevelNo
var TestNo

#Start/End Game
var GameOver : Panel
var StartPanel : Panel
var backToMenu : Button
var begin : Button
var EndState : Label
var PassFail : bool #True: test passed, False: test failed

# Get references to character and monster nodes in the HealthMonitor panel
var character1_node
var character2_node
var character3_node
var monster_node

#Score Settings
var ScoreTag : Label

#ObjectivePanel
var Objective : Panel

#Execute buttion
var Execute : Button

# Called when the node enters the scene tree for the first time.
func _ready():
	# Get references to character and monster nodes in the HealthMonitor panel
	character1_node = $HealthMonitor/Character1
	character2_node = $HealthMonitor/Character2
	character3_node = $HealthMonitor/Character3
	monster_node = $HealthMonitor/Monster
	
	#Objective
	Objective = $GameState	
	
	#begin
	StartPanel = $StartGame
	begin = $StartGame/Button
	StartPanel.show()
	
	#GameOver
	GameOver = $GameOver
	backToMenu = $GameOver/Button
	EndState = $GameOver/Text
	GameOver.hide()
	PassFail = false
	
	#audio
	EffectsPlayer = $Sounds/EffectsPlayer
	
	if GlobalVariables.CurrentLevel == 1:
		$GameState/Objective.visible = false
	else:
		$GameState/Objective.visible = true	
 	
	#hide all for startup
	$Message.visible = false
	$Actions.visible = false
	$HealthMonitor.visible = false
	$Progress.visible = false
	$GameState.visible = false
	$Info.visible = false
	$quit.visible = false
	
	#Disable execute buttion before game starts
	Execute = $Actions/Execute
	Execute.disabled = true
	
	Startup()
	
	#Level tracker
	LevelNo = $Info/LevelNo
	TestNo = $Info/TestNo
	if(GlobalVariables.CurrentLevel < 6):
		$GameState/Score.visible = false
		LevelNo.text = "Shift: " + str(GlobalVariables.CurrentLevel)
		TestNo.text = "Test: " + str(GlobalVariables.CurrentStage)
	else:
		LevelNo.text = "Shift: ENDLESS"
		TestNo.text = "Test: ENDLESS"
		$GameState/Score.visible = true
		$GameState/Score.text = "Score: " + str(GlobalVariables.Score)
	
	#declare global variables
	MinState = GlobalVariables.MinState
	YellowThreshold = GlobalVariables.YellowThreshold
	RedThreshold = GlobalVariables.RedThreshold
	MaxState = GlobalVariables.MaxState
	IncreaseRate = GlobalVariables.IncreaseRate
	DecreaseRate = GlobalVariables.DecreaseRate
	GlobalVariables.PowerState = true
	
	#Reset Values
	Reset()
	#Scoreboard
	GlobalVariables.Score = 0

	# Call the update_panel_color function for each character and the monster
	character1_node.update_panel_color(Character1)
	character2_node.update_panel_color(Character2)
	character3_node.update_panel_color(Character3)
	monster_node.update_panel_color(Monster)

func Beep():
	$beeper.play()

#startup animation
func Startup():
	#logo.show
	$Message.visible = true
	await get_tree().create_timer(.1).timeout
	$Info.visible = true
	await get_tree().create_timer(.1).timeout
	$HealthMonitor.visible = true
	await get_tree().create_timer(.1).timeout
	$HealthMonitor/Character1.Startup()
	await get_tree().create_timer(.1).timeout
	$HealthMonitor/Character2.Startup()
	await get_tree().create_timer(.1).timeout
	$HealthMonitor/Character3.Startup()
	await get_tree().create_timer(.1).timeout
	$HealthMonitor/Monster.Startup()
	await get_tree().create_timer(.1).timeout
	$Actions.visible = true
	await get_tree().create_timer(.1).timeout
	$Actions.Startup()
	await get_tree().create_timer(.1).timeout
	$GameState.visible = true
	await get_tree().create_timer(.1).timeout
	$GameState.Startup()
	await get_tree().create_timer(.1).timeout
	$Progress.visible = true
	await get_tree().create_timer(.1).timeout
	$quit.visible = true

#prevents values from going outside of set limits
func clamp_values():
	if Character1 < MinState:
		Character1 = MinState
	if Character2 < MinState:
		Character2 = MinState
	if Character3 < MinState:
		Character3 = MinState
	if Monster < MinState:
		Monster = MinState
	
	#Temp DeadCheck (eventually not needed)
	if Character1 >= MaxState:
		Character1 = MaxState * 100
	if Character2 >= MaxState:
		Character2 = MaxState * 100
	if Character3 >= MaxState:
		Character3 = MaxState * 100
	if Monster >= MaxState:
		Monster = MaxState * 100

#updates characters values and indicator color		
func UpdateStatus(char1:int, char2:int, char3:int, monster:int):
	
	Objective.GetObjective() #Check Objective
	#Update character values
	Character1 += char1
	Character2 += char2
	Character3 += char3
	Monster += monster
	
	if Monster >= GlobalVariables.RedThreshold: #Characters agitate alot faster when Monster is in red
		Character1 += GlobalVariables.IncreaseRate / 4
		Character2 += GlobalVariables.IncreaseRate / 4
		Character3 += GlobalVariables.IncreaseRate / 4
		
	if Monster >= GlobalVariables.YellowThreshold: #Characters agitate slightly faster when Monster is in yellow
		Character1 += (GlobalVariables.IncreaseRate / 6)
		Character2 += (GlobalVariables.IncreaseRate / 6)
		Character3 += (GlobalVariables.IncreaseRate / 6)
	
	clamp_values()
	
	#Update colors
	character1_node.update_panel_color(Character1)
	character2_node.update_panel_color(Character2)
	character3_node.update_panel_color(Character3)
	monster_node.update_panel_color(Monster)
	UpdateScore()

#plays sounds
func PlaySound(sound : int):
	EffectsPlayer.play_sound(sound)
	
#stars game, resets score
func StartGame():
	StartPanel.hide()
	Beep()
	Execute.disabled = false
	$Clock.Start()

#Updates score, checks for completion
func UpdateScore():
	if GlobalVariables.CurrentLevel < 6:
		$Progress.UpdateScore()
	$GameState/Score.text = "Score: " + str(GlobalVariables.Score)
	if GlobalVariables.Score >= GlobalVariables.TargetScore:
		PassFail = true
		if GlobalVariables.CurrentLevel < 6:
			EndGame()
	elif GlobalVariables.Score >= 0:
		if GlobalVariables.PowerState:
			GlobalVariables.Score += CalcScore(Character1) + CalcScore(Character2) + CalcScore(Character3) + CalcScore(Monster)
		else: #Bonus points if power is off
			GlobalVariables.Score += (CalcScore(Character1) + CalcScore(Character2) + CalcScore(Character3) + CalcScore(Monster)) * 1.5
	
	if CheckStatus():
		if GlobalVariables.Score > GlobalVariables.HighScore:
			GlobalVariables.HighScore = GlobalVariables.Score
		GlobalVariables.Score = -1
		EndGame()

#Checks if any failure state has passed
func CheckStatus():
	if Monster >= GlobalVariables.MaxState: #Monster has escaped
		return true
	if Character1 >= GlobalVariables.MaxState && Character2 >= GlobalVariables.MaxState && Character3 >= GlobalVariables.MaxState: #ALl characters are dead
		return true
	else:
		return false

#calculates score based on character values
func CalcScore(value:int):
	if value >= RedThreshold:
		return 20
	elif value >= YellowThreshold:
		return 10
	else:
		if GlobalVariables.Score <= 0:
			return 0
		else:
			return -5

#resets all values
func Reset():
	GlobalVariables.Score = 0
	Character1 = MinState
	Character2 = MinState
	Character3 = MinState
	Monster = MinState
	UpdateStatus(MinState,MinState,MinState,MinState)

#return to menu
func BackToMenu():
	Beep()
	await get_tree().create_timer(.2).timeout
	get_tree().change_scene_to_file("res://Level Select/Level Select Screen.tscn")

#Marks the level as complete with or without secondary objective
func MarkComplete():
	match GlobalVariables.CurrentStage:
		1:
			if Objective.GetObjective():
				GlobalVariables.Level1Status = 2
			else:
				GlobalVariables.Level1Status = 1
		2:
			if Objective.GetObjective():
				GlobalVariables.Level2Status = 2
			else: 
				GlobalVariables.Level2Status = 1
		3:
			if Objective.GetObjective():
				GlobalVariables.Level3Status = 2
			else:
				GlobalVariables.Level3Status = 1
			
#end game
func EndGame():
	$Clock.Stop()
	await get_tree().create_timer(3).timeout
	if(Monster >= MaxState && GlobalVariables.CurrentLevel == 5):
		#Go to end screen?
		PassFail = true
	if PassFail:
		MarkComplete()
		EndState.text = "Test Passed"
		$GameOver/Text.modulate = Color(0, 1, 0)
	else:
		EndState.text = "Test Failed"
		$GameOver/Text.modulate = Color(1, 0, 0)
		 
	$Actions.HideButtons() #Fix for issue of buttons being drawn in wrong hierarchy
	GameOver.show()
