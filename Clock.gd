extends Timer

var GameController: Node2D
var ObjectiveTracker : Panel
var IncreaseRate : int
var count : int
var ObjectiveCheck : int

# Called when the node enters the scene tree for the first time.
func _ready():
	#declare global variables
	ObjectiveTracker = $/root/Node2D/GameState
	IncreaseRate = GlobalVariables.IncreaseRate
	GameController = get_parent()
	count = 0
	match GlobalVariables.CurrentStage:
		1: 
			ObjectiveCheck = GlobalVariables.Level1Objective
		2: 
			ObjectiveCheck = GlobalVariables.Level2Objective
		3: 
			ObjectiveCheck = GlobalVariables.Level3Objective	

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
	
	IncreaseDifficulty()
	ObjectiveTracker.GetObjective(ObjectiveCheck)
	
#starts clock	
func Start():
	start()

#Every 30 cycles of he clock, difficulty increases by 2
func IncreaseDifficulty():
	if count > 30:
		GlobalVariables.IncreaseRate = GlobalVariables.IncreaseRate * 2
		count = 0
	else:
		count += 1
