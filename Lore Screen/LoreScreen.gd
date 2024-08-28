extends Node2D

var Return : Button
var Player : AudioStreamPlayer2D
var panels = []
# Called when the node enters the scene tree for the first time.
func _ready():
	Return = $Return
	Player = $LogPlayer
	panels = [$AudioTrack1/Subtitle, $AudioTrack2/Subtitle, $AudioTrack3/Subtitle, $AudioTrack4/Subtitle, $AudioTrack5/Subtitle,$AudioTrack6/Subtitle, $AudioTrack7/Subtitle, $AudioTrack8/Subtitle, $AudioTrack9/Subtitle]
	$AudioTrack1.visible = false
	$AudioTrack2.visible = false
	$AudioTrack3.visible = false
	$AudioTrack4.visible = false
	$AudioTrack5.visible = false
	$AudioTrack6.visible = false
	$AudioTrack7.visible = false
	$AudioTrack8.visible = false
	$AudioTrack9.visible = false
	$AudioTrack1.Lock()
	$AudioTrack2.Lock()
	$AudioTrack3.Lock()
	$AudioTrack4.Lock()
	$AudioTrack5.Lock()
	$AudioTrack6.Lock()
	$AudioTrack7.Lock()
	$AudioTrack8.Lock()
	$AudioTrack9.Lock()
	startup()
	await get_tree().create_timer(.5).timeout
	SearchLogs()	

#Find which logs need to be unlocked
func SearchLogs():
	var count = 0
	for i in GlobalVariables.UnlockedLogs:
		if i == 1:
			Unlock(count, true)
		else:
			Unlock(count, false)
		count += 1
		await get_tree().create_timer(.2).timeout

#startup animation
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

#Locks or Unlocks each audio log
func Unlock(log : int, check :bool):
	match log:
		0:
			if check:
				$AudioTrack1.Unlock("NexsMarketingAd.mp3")
			else:
				$AudioTrack1.Lock()
		1:
			if check:
				$AudioTrack2.Unlock("Operator481Journal1.mp3")
			else:
				$AudioTrack2.Lock()
		2:
			if check:
				$AudioTrack3.Unlock("TheAwakening.mp3")
			else:
				$AudioTrack3.Lock()
		3:
			if check:
				$AudioTrack4.Unlock("SomethingIsWrong.mp3")
			else:
				$AudioTrack4.Lock()
		4:
			if check:
				$AudioTrack5.Unlock("OneFinalShift.mp3")
			else:
				$AudioTrack5.Lock()
		5:
			if check:
				$AudioTrack6.Unlock("Awake.mp3")
			else:
				$AudioTrack6.Lock()
		6:
			if check:
				$AudioTrack7.Unlock("NotTooLate.mp3")
			else:
				$AudioTrack7.Lock()
		7:
			if check:
				$AudioTrack8.Unlock("Dreams.mp3")
			else:
				$AudioTrack8.Lock()
		8:
			if check:
				$AudioTrack9.Unlock("AudioLog9.mp3")
			else:
				$AudioTrack9.Lock()	

func on_Play_pressed():
	Player.play_message(GlobalVariables.CurrentLog)
	Subtitle(GlobalVariables.CurrentLog)

func Subtitle(index : int):
	var counter = 0
	for panel in panels:
		if counter == index:
			panel.visible = true
		else:
			panel.visible = false
		counter += 1
	
func hideAll():
	for panel in panels:
		panel.visible = false

func Back():
	get_tree().change_scene_to_file("res://Level Select/Level Select Screen.tscn")
