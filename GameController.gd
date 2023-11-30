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

# Get references to character and monster nodes in the HealthMonitor panel
var character1_node
var character2_node
var character3_node
var monster_node

#Temp Settings/controls
var l1 : Label
var l2 : Label
var l3 : Label
var l4 : Label

#Score Settings
var GameState
var ScoreTag : Label

# Called when the node enters the scene tree for the first time.
func _ready():
	# Get references to character and monster nodes in the HealthMonitor panel
	character1_node = $HealthMonitor/Character1
	character2_node = $HealthMonitor/Character2
	character3_node = $HealthMonitor/Character3
	monster_node = $HealthMonitor/Monster
	
	#Temp Stuff
	l1 = $Extra/Label1
	l2 = $Extra/Label2
	l3 = $Extra/Label3
	l4 = $Extra/Label4
	
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
	
	#debug
	l1.text = "char1 " + str(Character1)
	l2.text = "char2 " + str(Character2)
	l3.text = "char3 " + str(Character3)
	l4.text = "Monster " + str(Monster)
	#print("Update ran")
	
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
	if (Character1 >= MaxState && Character2 >= MaxState && Character3 >= MaxState) || Monster >= MaxState:
		EndGame()
	else:
		GlobalVariables.Score += CalcScore(Character1) + CalcScore(Character2) + CalcScore(Character3) + CalcScore(Monster)
	
	ScoreTag.text = str(GlobalVariables.Score)
		
func CalcScore(value:int):
	if value >= RedThreshold:
		return 4
	elif value >= YellowThreshold:
		return 2
	else:
		return -2

func Reset():
	Character1 = MinState
	Character2 = MinState
	Character3 = MinState
	Monster = MinState
	UpdateStatus(MinState,MinState,MinState,MinState)

func EndGame():
	get_tree().change_scene_to_file("res://Level Select/Level Select Screen.tscn")
