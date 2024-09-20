extends Control

# Reference to the Character Panel node
var characterPanel: Panel

var CurrentState : int = 1 # 1 = green, 2 = yellow, 3= red, 4= flashing, 5=dead
var LastState : int

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
	FlashingState = GlobalVariables.MaxState - (2 * GlobalVariables.IncreaseRate)
	characterPanel = $Status
	$Sprite2D.visible = false
	$Status.visible = false
	LastState = CurrentState

#Startup animation
func Startup():
	$Sprite2D.visible = true
	await get_tree().create_timer(.2).timeout
	$Status.visible = true

# Function to update the color of the character panel
func update_panel_color(character_value: int):
	var OldValue = CharacterValue
	CharacterValue = character_value
	if characterPanel == null:
		print("Character Panel node not assigned!")
		return
	
	if character_value >= MaxState:
		characterPanel.modulate =  Color(0, 0, 0) # Black, character is dead
		CurrentState = 5
	elif character_value >= RedThreshold:
		CurrentState = 3
		if  character_value >= FlashingState:
			CurrentState = 4
			flash()
		else:
			characterPanel.modulate = Color(.5, 0, 0) # Red
	elif character_value >= YellowThreshold:
		CurrentState = 2
		characterPanel.modulate = Color(.5, .5, 0) # Yellow
	elif character_value >= MinState:
		CurrentState = 1
		characterPanel.modulate = Color(0, .5, 0) # green
	
	UpdateState(OldValue, CharacterValue)

func UpdateState(OldValue : int, NewValue : int):
	if LastState != CurrentState:
		if OldValue > NewValue:
			Sound(true)
		else:
			Sound(false)
	LastState = CurrentState
		
func Sound(sound : bool):
	if sound:
		$StatusAlarm.stream = preload("res://Assets/Audio Files/Actions Sounds/DownBeep.wav")
	else:
		$StatusAlarm.stream = preload("res://Assets/Audio Files/Actions Sounds/UpBeep.wav")
	
	$StatusAlarm.play()
	
#allows color panel to flash indicating status is near max value
func flash():
	characterPanel.modulate = Color(1, 0, 0) # light Red
	await get_tree().create_timer(.5).timeout
	characterPanel.modulate = Color(.4, 0, 0) # dark Red
	
	await get_tree().create_timer(.5).timeout
	
	characterPanel.modulate = Color(1, 0, 0) # light Red
	await get_tree().create_timer(.5).timeout
	characterPanel.modulate = Color(.4, 0, 0) #dark red
