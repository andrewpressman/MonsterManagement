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
	$Alert.visible = false
	$Background.visible = false

#play Current Level message
func PlayMessage():
	GlobalVariables.MessagePlayed = true;
	LogPlayer.play_message(GlobalVariables.CurrentLevel)
	MessagePlayed()
	#TODO: add condition for bonus log when objective is completed with all logs unlocked

func MessagePlayed():
	if GlobalVariables.MessagePlayed || GlobalVariables.GameStarted == 2:
		label.text = "Replay Message"
	else:
		label.text = "New message \navailable"
		Flash()

#Flash message box when new message is available
func Flash():
	for n in 20:
		if GlobalVariables.MessagePlayed == false:
			$Alert.visible = true
			$Background.visible = true
			await get_tree().create_timer(.5).timeout
			$Alert.visible = false
			$Background.visible = false
			await get_tree().create_timer(.5).timeout
