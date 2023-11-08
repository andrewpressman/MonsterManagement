extends Panel

var GameController: Node2D

#Monster Controls
var Agitate1Button: Button
var Agitate2Button: Button
var Agitate3Button: Button
var CalmButton: Button

#Power Controls
var PowerOnButton: Button
var PowerOffButton: Button

#Character Controls
var Char1Trigger : Button
var Char1Type : Button
var Char2Trigger : Button
var Char2Type : Button
var Char3Trigger : Button
var Char3Type : Button

var executeButton: Button

var selectedButton: Button  # Stores the currently selected button

func _ready():
	Agitate1Button = $Monster/Agitate1
	Agitate2Button = $Monster/Agitate2
	Agitate3Button = $Monster/Agitate3
	
	CalmButton = $Monster/Calm
	executeButton = $Execute
	
	PowerOnButton = $Environment/Power/PowerOn
	PowerOffButton = $Environment/Power/PowerOff
	
	Char1Trigger = $Environment/Char1Ping/PingTrigger
	Char1Type = $Environment/Char1Ping/PingType
	Char2Trigger = $Environment/Char2Ping/PingTrigger
	Char2Type = $Environment/Char2Ping/PingType
	Char3Trigger = $Environment/Char3Ping/PingTrigger
	Char3Type = $Environment/Char3Ping/PingType
	
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
	
	for button in [Agitate1Button, Agitate2Button, Agitate3Button, CalmButton, PowerOnButton, PowerOffButton, Char1Trigger, Char2Trigger, Char3Trigger]:
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
	
func _on_Char1Trigger_pressed():
	update_button_selection(Char1Trigger)

func _on_Char2Trigger_pressed():
	update_button_selection(Char2Trigger)
	
func _on_Char3Trigger_pressed():
	update_button_selection(Char3Trigger)

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
	
	#Triggers for specific character agitation: increase for true, decrease for false
	if selectedButton == Char1Trigger:
		if $Environment/Char1Ping.CheckType():
			GameController.UpdateStatus(1,0,0,0)
		else:
			GameController.UpdateStatus(-1,0,0,0)
			
	if selectedButton == Char2Trigger:
		if $Environment/Char2Ping.CheckType():
			GameController.UpdateStatus(0,1,0,0)
		else:
			GameController.UpdateStatus(0,-1,0,0)
			
	if selectedButton == Char3Trigger:
		if $Environment/Char3Ping.CheckType():
			GameController.UpdateStatus(0,0,1,0)
		else:
			GameController.UpdateStatus(0,0,-1,0)

	if CheckPower:
		#if power is off, increment all characters by 1 extra
		GameController.UpdateStatus(-1,-1,-1,0)
	else:
		GameController.UpdateStatus(1,1,1,1)
	
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


