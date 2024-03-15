extends Node2D

var Return : Button

# Called when the node enters the scene tree for the first time.
func _ready():
	Return = $Return
	SearchLogs()
	$AudioTrack1.visible = false
	$AudioTrack2.visible = false
	$AudioTrack3.visible = false
	$AudioTrack4.visible = false
	$AudioTrack5.visible = false
	$AudioTrack6.visible = false
	$AudioTrack7.visible = false
	$AudioTrack8.visible = false
	$AudioTrack9.visible = false
	startup()	
	
func SearchLogs():
	var count = 0
	for i in GlobalVariables.UnlockedLogs:
		if i == 1:
			Unlock(count, true)
		else:
			Unlock(count, false)
		count += 1

func startup():
	$AudioTrack1.visible = true
	await get_tree().create_timer(.2).timeout
	$AudioTrack2.visible = true
	await get_tree().create_timer(.2).timeout
	$AudioTrack3.visible = true
	await get_tree().create_timer(.2).timeout
	$AudioTrack4.visible = true
	await get_tree().create_timer(.2).timeout
	$AudioTrack5.visible = true
	await get_tree().create_timer(.2).timeout
	$AudioTrack6.visible = true
	await get_tree().create_timer(.2).timeout
	$AudioTrack7.visible = true
	await get_tree().create_timer(.2).timeout
	$AudioTrack8.visible = true
	await get_tree().create_timer(.2).timeout
	$AudioTrack9.visible = true



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

