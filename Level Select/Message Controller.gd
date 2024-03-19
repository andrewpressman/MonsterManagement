extends Panel

var Play : Button
var label : Label
var LogPlayer : AudioStreamPlayer2D
var MessageNo : int

func _ready():
	Play = $Button
	label = $Label
	LogPlayer = $LogPlayer
	MessagePlayed()

#play Current Level message
func PlayMessage():
	GlobalVariables.MessagePlayed = true;
	LogPlayer.play_message(GlobalVariables.CurrentLevel)
	MessagePlayed()
	#TODO: add condition for bonus log when objective is completed with all logs unlocked

func MessagePlayed():
	if GlobalVariables.MessagePlayed:
		label.text = "Replay Message"
	else:
		label.text = "New message \navailable"
