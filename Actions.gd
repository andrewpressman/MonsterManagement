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
var AllCharTrigger : Button

var executeButton: Button
var ExecuteClock : Timer
var CalmClock : Timer

var selectedButton: Button  # Stores the currently selected button

#Global Variables
var IncreaseRate : int
var DecreaseRate : int

func _ready():
	Agitate1Button = $Monster/Agitate1
	Agitate1Button.hide()
	Agitate2Button = $Monster/Agitate2
	Agitate2Button.hide()
	Agitate3Button = $Monster/Agitate3
	Agitate3Button.hide()
	CalmButton = $Monster/Calm
	CalmButton.hide()
	CalmClock = $Monster/Timer
	
	ExecuteClock = $ResetClock
	executeButton = $Execute
	executeButton.modulate = Color(0, 1, 0)
	
	PowerOnButton = $Environment/Power/PowerOn
	PowerOffButton = $Environment/Power/PowerOff
	
	Char1Trigger = $Environment/Char1Ping/PingTrigger
	Char1Type = $Environment/Char1Ping/PingType
	Char2Trigger = $Environment/Char2Ping/PingTrigger
	Char2Type = $Environment/Char2Ping/PingType
	Char3Trigger = $Environment/Char3Ping/PingTrigger
	Char3Type = $Environment/Char3Ping/PingType
	AllCharTrigger = $Environment/PingAll
	
	IncreaseRate = GlobalVariables.IncreaseRate
	DecreaseRate = GlobalVariables.DecreaseRate
	
	GameController = get_parent()
	# Initially, no button is selected
	selectedButton = null
	HideButtons()
	
func HideButtons(): #Hides all buttons, workaround for buttons being drawn over game over screen
	Agitate1Button.hide()
	Agitate2Button.hide()
	Agitate3Button.hide()
	CalmButton.hide()
	Char1Trigger.hide()
	Char1Type.hide()
	Char2Trigger.hide()
	Char2Type.hide()
	Char3Trigger.hide()
	Char3Type.hide()
	AllCharTrigger.hide()	
	PowerOnButton.hide()
	PowerOffButton.hide()
	executeButton.hide()

func Startup():
	PowerOffButton.show()
	await get_tree().create_timer(.1).timeout
	AllCharTrigger.show()
	await get_tree().create_timer(.1).timeout
	Char1Type.show()
	await get_tree().create_timer(.1).timeout
	Char2Type.show()
	await get_tree().create_timer(.1).timeout
	Char3Type.show()
	await get_tree().create_timer(.1).timeout
	Char1Trigger.show()
	await get_tree().create_timer(.1).timeout
	Char2Trigger.show()
	await get_tree().create_timer(.1).timeout
	Char3Trigger.show()		
	await get_tree().create_timer(.1).timeout
	Agitate1Button.show()
	await get_tree().create_timer(.1).timeout
	Agitate2Button.show()
	await get_tree().create_timer(.1).timeout
	Agitate3Button.show()
	await get_tree().create_timer(.1).timeout
	CalmButton.show()
	await get_tree().create_timer(.1).timeout
	executeButton.show()
	

# Function to update the button selection and visuals
func update_button_selection(button: Button):
	selectedButton = button
	selectedButton.button_pressed = true
	unselectButtions(false)
	

#unselets all control buttons
func unselectButtions(clear:bool):
	if clear:
		selectedButton = null
	for button in [Agitate1Button, Agitate2Button, Agitate3Button, CalmButton, PowerOnButton, PowerOffButton, Char1Trigger, Char2Trigger, Char3Trigger, AllCharTrigger]:
		if button != selectedButton:
			button.button_pressed = false

func _on_PowerOn_pressed():
	GlobalVariables.PowerState = true
	update_button_selection(PowerOnButton)

func _on_PowerOff_pressed():
	GlobalVariables.PowerState = false
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
	
func _on_AllCharTrigger_pressed():
	update_button_selection(AllCharTrigger)

# Callback when the "Execute" button is pressed
func _on_execute_button_pressed():
		
	if selectedButton == Agitate1Button:
		# ncrease all leveles at lowest rate
		GameController.UpdateStatus(IncreaseRate,IncreaseRate,IncreaseRate, IncreaseRate * 2)
		GameController.PlaySound(4)
		TickPower()
	elif selectedButton == Agitate2Button:
		# increase all leveles at medium rate
		GameController.UpdateStatus(IncreaseRate * 3,IncreaseRate * 3,IncreaseRate * 3,IncreaseRate * 4)
		GameController.PlaySound(5)
		TickPower()
	elif selectedButton == Agitate3Button:
		# increase all leveles at max rate
		GameController.UpdateStatus(3 * IncreaseRate,5 * IncreaseRate,5 * IncreaseRate,6 * IncreaseRate)
		GameController.PlaySound(6)
		TickPower()
	elif selectedButton == CalmButton:
		# decrease all levels
		GameController.UpdateStatus(DecreaseRate * 30,DecreaseRate * 30,DecreaseRate * 30,DecreaseRate * 30)
		GameController.PlaySound(8)
		TickPower()
		CalmLockout()
	elif selectedButton == PowerOnButton:
		# Increment Character1, Character2, and Character3
		GameController.UpdateStatus(DecreaseRate,DecreaseRate,DecreaseRate,0)
		GameController.PlaySound(2)
		togglePower()
	elif selectedButton == PowerOffButton:
		# Increment Character1, Character2, and Character3, and decrement Monster
		GameController.UpdateStatus(IncreaseRate,IncreaseRate,IncreaseRate,DecreaseRate)
		GameController.PlaySound(3)
		togglePower()
	#Triggers for specific character agitation: increase for true (agitate), decrease for false(calm)
	elif selectedButton == Char1Trigger:
		GameController.PlaySound(7)
		if $Environment/Char1Ping.CheckType():
			GameController.UpdateStatus(IncreaseRate * 5,0,0,0)
		else:
			GameController.UpdateStatus(DecreaseRate * 5,0,0,0)		
	elif selectedButton == Char2Trigger:
		GameController.PlaySound(7)
		if $Environment/Char2Ping.CheckType():
			GameController.UpdateStatus(0,IncreaseRate * 5,0,0)
		else:
			GameController.UpdateStatus(0,DecreaseRate * 5,0,0)	
	elif selectedButton == Char3Trigger:
		GameController.PlaySound(7)
		if $Environment/Char3Ping.CheckType():
			GameController.UpdateStatus(0,0,IncreaseRate * 5,0)
		else:
			GameController.UpdateStatus(0,0,DecreaseRate * 5,0)
	elif(selectedButton == AllCharTrigger):
		GameController.UpdateStatus(IncreaseRate,IncreaseRate,IncreaseRate,0)
		GameController.PlaySound(1)
		TickPower()
	else:
		#TODO: alert the player no button was pressed. TickPower anyways???
		TickPower()
		
	start_Clock()
	# Reset the button selection
	unselectButtions(true)
	
#if power is off, increment all characters by 1 extra
func TickPower():
	if CheckPower:
		GameController.UpdateStatus(DecreaseRate,DecreaseRate,DecreaseRate,IncreaseRate)
	else:
		GameController.UpdateStatus(IncreaseRate,IncreaseRate,IncreaseRate,DecreaseRate)

#locks calm button to prevent spamming
func CalmLockout():
	CalmClock.start()
	CalmButton.disabled = true
	CalmButton.focus_mode = Control.FOCUS_NONE

#re-enables calm button
func On_Calm_Timeout():
	CalmButton.disabled = false
	CalmButton.focus_mode = Control.FOCUS_ALL

#execute button timer
func start_Clock():
	ExecuteClock.start()
	executeButton.modulate = Color(1, 1, 1)
	executeButton.disabled = true
	executeButton.focus_mode = Control.FOCUS_NONE

#execute timer clock
func _on_clock_timeout():
	executeButton.modulate = Color(0, 1, 0)
	executeButton.disabled = false
	executeButton.focus_mode = Control.FOCUS_ALL

#return false is Power is OFF, return true is Power is ON
func CheckPower():
	if PowerOnButton.is_visible():
		return false
	else:
		return true

#toggle powers
func togglePower():
	if PowerOnButton.is_visible():
		PowerOnButton.hide()
		PowerOffButton.show()
	else:
		PowerOffButton.hide()
		PowerOnButton.show()		
