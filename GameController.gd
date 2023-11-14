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

# Get references to character and monster nodes in the HealthMonitor panel
var character1_node
var character2_node
var character3_node
var monster_node

#Temp Settings/controls
var Menu_Node
var GameOver
var Start : Button
var Extra : Panel
var l1 : Label
var l2 : Label
var l3 : Label
var l4 : Label

#Score Settings
var GameState
var Score : int
var ScoreTag : Label
var FinalScore : Label

# Called when the node enters the scene tree for the first time.
func _ready():
	# Get references to character and monster nodes in the HealthMonitor panel
	character1_node = $HealthMonitor/Character1
	character2_node = $HealthMonitor/Character2
	character3_node = $HealthMonitor/Character3
	monster_node = $HealthMonitor/Monster
	
	#Temp Stuff
	Menu_Node = $Menu/MenuBox
	GameOver = $Menu/MenuBox/GameOver
	GameOver.hide()
	Start = $Menu/MenuBox/Start
	Menu_Node.modulate = Color(1, 0, 0) # Red
	FinalScore = $Menu/MenuBox/FinalScore
	FinalScore.hide()
	l1 = $Extra/Label1
	l2 = $Extra/Label2
	l3 = $Extra/Label3
	l4 = $Extra/Label4
	
	#declare global variables
	MinState = GlobalVariables.MinState
	YellowThreshold = GlobalVariables.MinState
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
	Score = 0
	ScoreTag = $GameState/Score
	ScoreTag.text = str(Score)

	# Call the update_panel_color function for each character and the monster
	character1_node.update_panel_color(Character1)
	character2_node.update_panel_color(Character2)
	character3_node.update_panel_color(Character3)
	monster_node.update_panel_color(Monster)

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
	print(Character1)
	Character1 += char1
	print(Character1)
	Character2 += char2
	Character3 += char3
	Monster += monster
	clamp_values()
	
	#debug
	l1.text = "char1 " + str(Character1)
	l2.text = "char2 " + str(Character1)
	l3.text = "char3 " + str(Character1)
	l4.text = "Monster " + str(Monster)
	print("Update ran")
	
	character1_node.update_panel_color(Character1)
	character2_node.update_panel_color(Character2)
	character3_node.update_panel_color(Character3)
	monster_node.update_panel_color(Monster)
	
	UpdateScore()
	
func StartGame():
	Reset()	
	Score = 0
	$Clock.Start()
	Menu_Node.hide()

func UpdateScore():
	if (Character1 >= MaxState && Character2 >= MaxState && Character3 >= MaxState) || Monster >= MaxState:
		FinalScore.text = "Final Score: " + str(Score)
		EndGame()
	else:
		Score += CalcScore(Character1) + CalcScore(Character2) + CalcScore(Character3) + CalcScore(Monster)
	
	ScoreTag.text = str(Score)
		
func CalcScore(value:int):
	if value >= RedThreshold:
		return 10
	elif value >= YellowThreshold:
		return 5

func Reset():
	Character1 = MinState
	Character2 = MinState
	Character3 = MinState
	Monster = MinState
	UpdateStatus(MinState,MinState,MinState,MinState)

func EndGame():
	Menu_Node.show()
	FinalScore.show()
	GameOver.show()
