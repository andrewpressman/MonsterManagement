extends Timer

var GameController: Node2D
var GreenRate : int
var YellowRate : int
var RedRate : int


# Called when the node enters the scene tree for the first time.
func _ready():
	#declare global variables
	GreenRate = GlobalVariables.GreenRate
	YellowRate = GlobalVariables.YellowRate
	RedRate = GlobalVariables.RedRate

func _on_timer_timeout():
	# Generate a random number between 1 and 100
	var CharacterTrack = randi_range(1,3)
	var MonsterTrack = randi_range(1,4)
	
	match CharacterTrack:
		1:
			GameController.UpdateStatus(GreenRate,0,0,0)
		2:
			GameController.UpdateStatus(0,GreenRate,0,0)
		3:
			GameController.UpdateStatus(0,0,GreenRate,0)
	
	match MonsterTrack:
		1:
			GameController.UpdateStatus(0,0,0,GreenRate)
		4:
			GameController.UpdateStatus(0,0,0,GreenRate * 2)
	
func Start():
	start()
