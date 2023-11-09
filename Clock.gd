extends Timer

var GameController: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	GameController = get_parent()

func _on_timer_timeout():
	# Generate a random number between 1 and 100
	var CharacterTrack = randi_range(1,3)
	var MonsterTrack = randi_range(1,4)
	
	match CharacterTrack:
		1:
			GameController.UpdateStatus(1,0,0,0)
		2:
			GameController.UpdateStatus(0,1,0,0)
		3:
			GameController.UpdateStatus(0,0,1,0)
	
	match MonsterTrack:
		1:
			GameController.UpdateStatus(0,0,0,1)
		4:
			GameController.UpdateStatus(0,0,0,4)
	
func Start():
	start()
