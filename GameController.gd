extends Node2D

#goals: Keep characters in Scared State, Don't let Monster Escape

# 1- calm, 2-scared, 3-panic 4-dead
var Character1 : int
var Character2 : int
var Character3 : int

# 1- inactive, 2-active, 3-angry, 4-escaped
var Monster : int

# Get references to character and monster nodes in the HealthMonitor panel
var character1_node
var character2_node
var character3_node
var monster_node

#Temp Menu Settings
var Menu_Node
var GameOver
var Start : Button

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
	
	#Menu loading
	Menu_Node = $Menu/MenuBox
	GameOver = $Menu/MenuBox/GameOver
	GameOver.hide()
	Start = $Menu/MenuBox/Start
	Menu_Node.modulate = Color(1, 0, 0) # Red
	FinalScore = $Menu/MenuBox/FinalScore
	FinalScore.hide()

	# TEMP
	Character1 = 0
	Character2 = 0
	Character3 = 0
	Monster = 0

	#Scoreboard
	Score = 0
	ScoreTag = $GameState/Score
	ScoreTag.text = str(Score)

	# Call the update_panel_color function for each character and the monster
	character1_node.update_panel_color(Character1)
	character2_node.update_panel_color(Character2)
	character3_node.update_panel_color(Character3)
	monster_node.update_panel_color(Monster)

#
func clamp_values():
	if Character1 < 0:
		Character1 = 0
	if Character2 < 0:
		Character2 = 0
	if Character3 < 0:
		Character3 = 0
	if Monster < 0:
		Monster = 0
	
	#Temp DeadCheck
	if Character1 >= 9:
		Character1 = 100
	if Character2 >= 9:
		Character2 = 100
	if Character3 >= 9:
		Character3 = 100
	if Monster >= 9:
		Monster = 100
		
func UpdateStatus(char1:int, char2:int, char3:int, monster:int):
	Character1 += char1
	Character2 += char2
	Character3 += char3
	Monster += monster
	clamp_values()
	
	#debug
	print("Character 1 value:", Character1)
	#print("Character 1 change:", char1)
	print("Character 2 value:", Character2)
	#print("Character 2 change:", char2)
	print("Character 3 value:", Character3)
	#print("Character 3 change:", char3)
	print("Monster value:", Monster)
	#print("Monster change:", monster)
	print("")
	
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
	if (Character1 >= 9 && Character2 >= 9 && Character3 >= 9) || Monster >= 9:
		FinalScore.text = "Final Score: " + str(Score)
		EndGame()
	else:
		Score += CalcScore(Character1) + CalcScore(Character2) + CalcScore(Character3) + CalcScore(Monster)
	
	ScoreTag.text = str(Score)
		
func CalcScore(value:int):
	if value >= 8:
		return 3
	elif value >= 6:
		return 2
	elif value >= 3:
		return 1
	elif value >= 0:
		return 0

func Reset():
	Character1 = 0
	Character2 = 0
	Character3 = 0
	Monster = 0
	UpdateStatus(0,0,0,0)

func EndGame():
	Menu_Node.show()
	FinalScore.show()
	GameOver.show()
