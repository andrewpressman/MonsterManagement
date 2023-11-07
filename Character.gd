extends Control

# Reference to the Character Panel node
var characterPanel: Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	characterPanel = $Status

# Function to update the color of the character panel
func update_panel_color(character_value: int):
	if character_value >= 9:
		characterPanel.modulate =  Color(0, 0, 0) # Black
		#character is dead
	elif character_value >= 6:
		characterPanel.modulate = Color(1, 0, 0) # Red
	elif character_value >= 3:
		characterPanel.modulate = Color(1, 1, 0) # Yellow
	elif character_value >= 0:
		characterPanel.modulate = Color(0,1,0) # green



