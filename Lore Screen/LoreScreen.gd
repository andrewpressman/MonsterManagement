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
			if check:
				$AudioTrack2.Unlock()
				print("log 2")
			else:
				print("locked")
				$AudioTrack2.Lock()
		2:
			if check:
				$AudioTrack3.Unlock()
				print("log 3")
			else:
				print("locked")
				$AudioTrack3.Lock()
		3:
			if check:
				$AudioTrack4.Unlock()
				print("log 4")
			else:
				print("locked")
				$AudioTrack4.Lock()
		4:
			if check:
				$AudioTrack5.Unlock()
				print("log 5")
			else:
				print("locked")
				$AudioTrack5.Lock()
		5:
			if check:
				$AudioTrack6.Unlock()
				print("log 6")
			else:
				print("locked")
				$AudioTrack6.Lock()
		6:
			if check:
				$AudioTrack7.Unlock()
				print("log 7")
			else:
				print("locked")
				$AudioTrack7.Lock()
		7:
			if check:
				$AudioTrack8.Unlock()
				print("log 8")
			else:
				print("locked")
				$AudioTrack8.Lock()
		8:
			if check:
				$AudioTrack9.Unlock()
				print("log 9")
			else:
				print("locked")
				$AudioTrack9.Lock()

		
	
func Back():
	get_tree().change_scene_to_file("res://Level Select/Level Select Screen.tscn")

