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
	# Generate a random number between 1 and 5
	var MonsterTrack = randi_range(1,5)
	
	# Generate a random number between 1 and 10
	var CharacterTrack = randi_range(1,10)
	
	# 3/10 chance one of the characters gets pinged
	match CharacterTrack:
		1:
			GameController.UpdateStatus(IncreaseRate,0,0,0)
		2:
			GameController.UpdateStatus(0,IncreaseRate,0,0)
		3:
			GameController.UpdateStatus(0,0,IncreaseRate,0)
	
	#1/5 chance monster gets pinged, 1/5 chance monster gets boosted pinged
	match MonsterTrack:
		3:
			GameController.UpdateStatus(0,0,0,IncreaseRate)
		5:
			GameController.UpdateStatus(0,0,0,IncreaseRate * 1.5)
	
	GameController.UpdateStatus(0,0,0,0)
	IncreaseDifficulty()
	
#starts clock	
func Start():
	start()
	
func Stop():
	stop()

#Every 30 cycles (+ scale of current level) of he clock, difficulty increases by 2
func IncreaseDifficulty():
	if count > 30 + GetLevel():
		GlobalVariables.IncreaseRate = GlobalVariables.IncreaseRate * 2
		count = 0
	else:
		count += 1

#difficulty scales faster at harder levles 
#TODO: balance
func GetLevel():
	if GlobalVariables.CurrentLevel == 1:
		return 20
	
	elif GlobalVariables.CurrentLevel == 2:
		return 15
	
	elif GlobalVariables.CurrentLevel == 3:
		return 10
	
	elif GlobalVariables.CurrentLevel == 4:
		return 5
	
	else:
		return 0
