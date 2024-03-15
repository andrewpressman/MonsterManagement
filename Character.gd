extends Control

# Reference to the Character Panel node
var characterPanel: Panel

var MinState : int
var YellowThreshold : int
var RedThreshold : int
var MaxState : int

var FlashingState : int
var CharacterValue : int

# Called when the node enters the scene tree for the first time.
func _ready():
	MinState= GlobalVariables.MinState
	YellowThreshold= GlobalVariables.YellowThreshold
	RedThreshold= GlobalVariables.RedThreshold
	MaxState= GlobalVariables.MaxState
	FlashingState = GlobalVariables.MaxState - (3 * GlobalVariables.IncreaseRate)
	characterPanel = $Status

# Function to update the color of the character panel
func update_panel_color(character_value: int):
	CharacterValue = character_value
	if characterPanel == null:
		print("Character Panel node not assigned!")
		return
	
	if character_value >= MaxState:
		characterPanel.modulate =  Color(0, 0, 0) # Black, character is dead
	elif character_value >= RedThreshold:
		if  character_value >= FlashingState:
			flash()
		else:
			characterPanel.modulate = Color(.5, 0, 0) # Red
	elif character_value >= YellowThreshold:
		characterPanel.modulate = Color(.5, .5, 0) # Yellow
	elif character_value >= MinState:
		characterPanel.modulate = Color(0, .5, 0) # green


func flash():
	characterPanel.modulate = Color(1, 0, 0) # light Red
	await get_tree().create_timer(.5).timeout
	characterPanel.modulate = Color(.4, 0, 0) # dark Red
	
	await get_tree().create_timer(.5).timeout
	
	characterPanel.modulate = Color(1, 0, 0) # light Red
	await get_tree().create_timer(.5).timeout
	characterPanel.modulate = Color(.4, 0, 0) #dark red
