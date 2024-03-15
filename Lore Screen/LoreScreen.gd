extends Node2D

var Return : Button

# Called when the node enters the scene tree for the first time.
func _ready():
	Return = $Return
	SearchLogs()

func SearchLogs():
	var count = 0
	for i in GlobalVariables.UnlockedLogs:
		if i == 1:
			Unlock(count, true)
		else:
			Unlock(count, false)
		count += 1

func Unlock(log : int, check :bool):
	match log:
		0:
			if check:
				$AudioTrack1.Unlock()
				print("log 1")
			else:
				print("locked")
				$AudioTrack1.Lock()
		1:
			print("log 2")
		2:
			print("log 3")
		3:
			print("log 4")
		4:
			print("log 5")
		5:
			print("log 6")
		6:
			print("log 7")
		7:
			print("log 8")
		8:
			print("log 9")

		
	
func Back():
	get_tree().change_scene_to_file("res://Level Select/Level Select Screen.tscn")

