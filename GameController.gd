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

#GameOver
var GameOver : Panel
var backToMenu : Button

# Get references to character and monster nodes in the HealthMonitor panel
var character1_node
var character2_node
var character3_node
var monster_node

#Score Settings
var GameState
var ScoreTag : Label

#ObjectivePanel
var Objective : Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	# Get references to character and monster nodes in the HealthMonitor panel
	character1_node = $HealthMonitor/Character1
	character2_node = $HealthMonitor/Character2
	character3_node = $HealthMonitor/Character3
	monster_node = $HealthMonitor/Monster
	
	#Objective
	Objective = $GameState
	
	#GameOver
	GameOver = $GameOver
	backToMenu = $GameOver/Button
	GameOver.modulate = Color(1, 0, 0)
	GameOver.hide()
	
	#audio
	EffectsPlayer = $Sounds/EffectsPlayer
	
	#declare global variables
	MinState = GlobalVariables.MinState
	YellowThreshold = GlobalVariables.YellowThreshold
	RedThreshold = GlobalVariables.RedThreshold
	MaxState = GlobalVariables.MaxState
	IncreaseRate = GlobalVariables.IncreaseRate
	DecreaseRate = GlobalVariables.DecreaseRate
	# TEMP
	Character1 = MinState
	Character2 = MinState
	Character3 = MinState
	Monster = MinState

	#Scoreboard
	GlobalVariables.Score = 0
	ScoreTag = $GameState/Score
	ScoreTag.text = str(GlobalVariables.Score)

	# Call the update_panel_color function for each character and the monster
	character1_node.update_panel_color(Character1)
	character2_node.update_panel_color(Character2)
	character3_node.update_panel_color(Character3)
	monster_node.update_panel_color(Monster)
	
	StartGame()

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
		
func UpdateStatus(char1:int, char2:int, char3:int, monster:int):
	#print("1: " + str(char1) + " 2: " + str(char2) +" 3: " + str(char3) + " Monster: " + str(monster))
	Character1 += char1
	Character2 += char2
	Character3 += char3
	Monster += monster
	clamp_values()
	
	character1_node.update_panel_color(Character1)
	character2_node.update_panel_color(Character2)
	character3_node.update_panel_color(Character3)
	monster_node.update_panel_color(Monster)
	
	UpdateScore()

func PlaySound(sound : int):
	EffectsPlayer.play_sound(sound)
	
func StartGame():
	#Reset()	
	GlobalVariables.Score = 0
	$Clock.Start()

func UpdateScore():
	if GlobalVariables.Score >= GlobalVariables.TargetScore:
		#if Objective.GetObjective():
		#	pass
		EndGame()
	else:
		GlobalVariables.Score += CalcScore(Character1) + CalcScore(Character2) + CalcScore(Character3) + CalcScore(Monster)
	
	ScoreTag.text = str(GlobalVariables.Score)
	
	if GlobalVariables.Score > 1000 || CheckStatus():
		EndGame()

func CheckStatus():
	if Monster >= GlobalVariables.MaxState:
		return true
	if Character1 >= GlobalVariables.MaxState && Character2 >= GlobalVariables.MaxState && Character3 >= GlobalVariables.MaxState:
		return true
	else:
		return false

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

func Reset():
	Character1 = MinState
	Character2 = MinState
	Character3 = MinState
	Monster = MinState
	UpdateStatus(MinState,MinState,MinState,MinState)

func BackToMenu():
	get_tree().change_scene_to_file("res://Level Select/Level Select Screen.tscn")


func EndGame():
	#TODO track if objective was passed
	GameOver.show()
	#get_tree().change_scene_to_file("res://Level Select/Level Select Screen.tscn")
