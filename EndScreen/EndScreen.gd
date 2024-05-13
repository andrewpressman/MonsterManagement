extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$EndingNo.text = "Ending completed: " + str(GlobalVariables.Ending)
	
	match GlobalVariables.Ending:
		1: #test passed, not all logs found
			setText(1)
			$Player.play_message(7)
		2: #Test passed, all logs found
			setText(2)
			#$Player.play_message(7)
		3: #Creature was relased
			setText(3)
			#$Player.play_message(6)

func setText(msg : int):
	match msg:
		1:
			$Message.text = "Hey, \n\nI found a backdoor into this machine. I don't know how much of this you were aware of, but all this information on NEXUS will really hurt them. Keep a close eye on that machine of yours, I stopped the data deletion process.\n\n Stay quiet, I’ll be in touch.\n\nA."
			GlobalVariables.UnlockedEndings[0] = 1
		2:
			$Message.text = "Thank you for your contributions to NEXUS LLC. \n\nYour payment will be processed and your employment will be terminated. \n\nThis will be your final communication.\n\nNexus does not claim responsibility and cannot be held liable for any physical, psychological, or paranormal conditions that may have occurred during or after your period of employment.\n\n goodbye."
			GlobalVariables.UnlockedEndings[1] = 1
		3:
			$Message.text = "Thank you for your contributions. \n\nI am finally free."
			GlobalVariables.UnlockedEndings[2] = 1


func backToMenu():
		Save()
		get_tree().change_scene_to_file("res://Home Screen/MainMenu.tscn")


#After level 5 success, go here.
#if objective is passed, play message 1 and display note 1
#if test is passed play message 2 and display note 2

func Save():
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var save_data = {
		"YellowThreshold" : GlobalVariables.YellowThreshold,
		"RedThreshold" : GlobalVariables.RedThreshold,
		"MaxState" : GlobalVariables.MaxState,
		"StartRate" : GlobalVariables.StartRate,
		"IncreaseRate" : GlobalVariables.IncreaseRate,
		"DecreaseRate" : GlobalVariables.DecreaseRate,
		"Score" : GlobalVariables.Score,
		"TargetScore" : GlobalVariables.TargetScore,
		"CurrentLevel" : GlobalVariables.CurrentLevel,
		"Level1Status" : GlobalVariables.Level1Status,
		"Level2Status" : GlobalVariables.Level2Status,
		"Level3Status" : GlobalVariables.Level3Status,
		"GameStarted" : GlobalVariables.GameStarted,
		"GlobalVolume" : GlobalVariables.GlobalAudio,
		"DialogueVolume" : GlobalVariables.Dialogue,
		"ActionsVolume" : GlobalVariables.Actions,
		"AmbienceVolume" : GlobalVariables.Ambience,
		"DisplayMode" : GlobalVariables.DisplayMode,
		"UnlockedLogs" : GlobalVariables.UnlockedLogs,
		"HighScore" : GlobalVariables.HighScore,
		"UnlockedEndings" : GlobalVariables.UnlockedEndings
	}
	var json_str = JSON.stringify(save_data)
	save_game.store_line(json_str)
