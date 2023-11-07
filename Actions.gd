extends Panel

var GameController: Node2D

var Agitate1Button: Button
var Agitate2Button: Button
var Agitate3Button: Button
var CalmButton: Button
var PowerOnButton: Button
var PowerOffButton: Button
var executeButton: Button

var selectedButton: Button  # Stores the currently selected button

func _ready():
	Agitate1Button = $Agitate1
	Agitate2Button = $Agitate2
	Agitate3Button = $Agitate3
	CalmButton = $Calm
	executeButton = $Execute
	PowerOnButton = $PowerOn
	PowerOffButton = $PowerOff
	GameController = get_parent()
	# Initially, no button is selected
	selectedButton = null
	
	PowerOnButton.hide()

# Function to update the button selection and visuals
func update_button_selection(button: Button):
	selectedButton = button
	selectedButton.modulate = Color(0, 1, 0)  # Set selected button to green
	unselectButtions(false)

func unselectButtions(clear:bool):
	if clear:
		selectedButton = null
	
	for button in [Agitate1Button, Agitate2Button, Agitate3Button, CalmButton, PowerOnButton, PowerOffButton]:
		if button != selectedButton:
			button.modulate = Color(1, 1, 1)  # Reset color

func _on_PowerOn_pressed():
	update_button_selection(PowerOnButton)

func _on_PowerOff_pressed():
	update_button_selection(PowerOffButton)

func _on_Agitate1_pressed():
	update_button_selection(Agitate1Button)
	
func _on_Agitate2_pressed():
	update_button_selection(Agitate2Button)
	
func _on_Agitate3_pressed():
	update_button_selection(Agitate3Button)

func _on_Calm_pressed():
	update_button_selection(CalmButton)

# Callback when the "Execute" button is pressed
func _on_execute_button_pressed():
	if selectedButton == Agitate1Button:
		# Increment Character1, Character2, and Character3 by 1, and decrement Monster by 1
		GameController.UpdateStatus(1,1,1,1)
		
	if selectedButton == Agitate2Button:
		# Increment Character1, Character2, and Character3 by 2, and decrement Monster by 2
		GameController.UpdateStatus(2,2,2,2)
		
	if selectedButton == Agitate3Button:
		# Increment Character1, Character2, and Character3 by 3, and decrement Monster by 3
		GameController.UpdateStatus(3,3,3,3)

	if selectedButton == CalmButton:
		# Decrement Character1, Character2, and Character3 by 1, and increment Monster by 1
		GameController.UpdateStatus(-2,-2,-2,-2)
		
	if selectedButton == PowerOnButton:
		# Increment Character1, Character2, and Character3 by 1, and decrement Monster by 1
		GameController.UpdateStatus(-1,-1,-1,0)
		togglePower()
		
	if selectedButton == PowerOffButton:
		# Increment Character1, Character2, and Character3 by 1, and decrement Monster by 1
		GameController.UpdateStatus(1,1,1,0)
		togglePower()
	
	if CheckPower:
		#if power is off, increment all characters by 1 extra
		GameController.UpdateStatus(1,1,1,0)
	else:
		GameController.UpdateStatus(-1,-1,-1,1)
	
	# Reset the button selection
	unselectButtions(true)

#return false is Power is OFF, return true is Power is ON
func CheckPower():
	if PowerOnButton.is_visible():
		return false
	else:
		return true

func togglePower():
	if PowerOnButton.is_visible():
		PowerOnButton.hide()
		PowerOffButton.show()
	else:
		PowerOffButton.hide()
		PowerOnButton.show()		


