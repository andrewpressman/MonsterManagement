extends Node

var PingType : CheckButton
var PingTrigger : Button

func _ready():
	PingTrigger = $PingTrigger
	PingType = $PingType

	# Connect the CheckButton's "toggled" signal to the "_on_check_button_toggled" method

func _on_check_button_toggled(_button_pressed):
	# Check if the CheckButton is checked
	if PingType.is_pressed():
		PingType.text = "Anger"
	else:
		PingType.text = "Calm"

func CheckType():
	if PingType.is_pressed():
		return true
	else:
		return false
