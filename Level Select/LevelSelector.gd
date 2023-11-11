extends Panel

var GameController: Node2D

#Monster Controls
var Level1Button: Button
var Level2Button: Button
var Level3Button: Button

var executeButton: Button

var selectedButton: Button  # Stores the currently selected button

func _ready():
	Level1Button = $Level1/select
	Level2Button = $Level2/select
	Level3Button = $Level3/select
		
	#GameController = get_parent() #TODO: ping to GameController scene
	# Initially, no button is selected
	selectedButton = null

# Function to update the button selection and visuals
func update_button_selection(button: Button):
	selectedButton = button
	selectedButton.modulate = Color(0, 1, 0)  # Set selected button to green
	unselectButtions(false)

func unselectButtions(clear:bool):
	if clear:
		selectedButton = null
	
	for button in [Level1Button, Level2Button, Level3Button]:
		if button != selectedButton:
			button.modulate = Color(1, 1, 1)  # Reset color

#TODO: properly show/hide info panels
func _on_Level1_pressed():
	update_button_selection(Level1Button)
	$Level2/BigInfo.hide();
	$Level3/BigInfo.hide();
	
func _on_Level2_pressed():
	update_button_selection(Level2Button)
	$Level1/BigInfo.hide();
	$Level3/BigInfo.hide();
	
func _on_Level3_pressed():
	update_button_selection(Level3Button)
	$Level2/BigInfo.hide();
	$Level1/BigInfo.hide();

func _on_begin_button_pressed():
	if selectedButton == Level1Button:
		pass
		
	if selectedButton == Level2Button:
		pass
		
	if selectedButton == Level3Button:
		pass
	
	# Reset the button selection
	unselectButtions(true)

func StartGame():
	#pass in parameters for game
	get_tree().change_scene_to_file("res://Level Select/Level Select Screen.tscn")
