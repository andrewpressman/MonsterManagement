extends Timer

var GameController: Node2D
var IncreaseRate : int
var count : int

# Called when the node enters the scene tree for the first time.
func _ready():
	#declare global variables
	IncreaseRate = GlobalVariables.IncreaseRate
	GameController = get_parent()
	count = 0

func _on_timer_timeout():
	# Generate a random number between 1 and 100
	var MonsterTrack = randi_range(1,4)
	
	var CharacterTrack = randi_range(1,10)
	match CharacterTrack:
		1:
			GameController.UpdateStatus(IncreaseRate,0,0,0)
		2:
			GameController.UpdateStatus(0,IncreaseRate,0,0)
		3:
			GameController.UpdateStatus(0,0,IncreaseRate,0)
	
	match MonsterTrack:
		3:
			GameController.UpdateStatus(0,0,0,IncreaseRate)
		5:
			GameController.UpdateStatus(0,0,0,IncreaseRate * 1.5)
	
	IncreaseDifficulty()
	
func Start():
	start()

func IncreaseDifficulty():
	if count > 30:
		GlobalVariables.IncreaseRate = GlobalVariables.IncreaseRate * 2
		count = 0
	else:
		count += 1
