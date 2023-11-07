extends Timer

var GameController: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	GameController = get_parent()

func _on_timer_timeout():
	GameController.UpdateStatus(1,1,1,1)
	
func Start():
	start()
