extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$EndingNo.text = "Ending completed: " + str(GlobalVariables.Ending)
	
	match GlobalVariables.Ending:
		1: #test passed, not all logs found
			$Player.play_message(7)
		2: #Test passed, all logs found
			pass
			#$Player.play_message(7)
		3: #Creature was relased
			$Player.play_message(6)


func backToMenu():
		get_tree().change_scene_to_file("res://Home Screen/MainMenu.tscn")


#After level 5 success, go here.
#if objective is passed, play message 1 and display note 1
#if test is passed play message 2 and display note 2


#complete = 2, failed = 1
func SelectEnding():
	match GlobalVariables.Level1Status:
		1:
			GlobalVariables.Ending = 1
		2:
			if GlobalVariables.UnlockedLogs == [1,1,1,1,1,1,1,1,1]:
				GlobalVariables.Ending = 3
			else:
				GlobalVariables.Ending = 2
