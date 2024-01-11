extends Node

var PingType : CheckButton
var PingTrigger : Button

func _ready():
	PingTrigger = $PingTrigger
	PingType = $PingType

func _on_check_button_toggled(_button_pressed):
	# Check if the CheckButton is checked
	if PingType.is_pressed():
		PingType.text = "Anger"
	else:
		PingType.text = "Calm"

#return true for anger toggle, return false for calm toggle
func CheckType():
	if PingType.is_pressed():
		return true
	else:
		return false
