extends Node2D

var Continue : Button
var NewGame : Button
var Options : Button
var Quit : Button


# Called when the node enters the scene tree for the first time.
func _ready():
	LoadGame()
	Continue = $MainMenu/Continue
	NewGame = $MainMenu/NewGame
	Options = $MainMenu/Options
	Quit = $MainMenu/Quit
	if GlobalVariables.GameStarted == 1 && GlobalVariables.CurrentLevel <= 5 :
		Continue.show()
	else:
		Continue.hide()

func StartNewGame():
	#clear Savegame
	GlobalVariables.Level1Status = 0
	GlobalVariables.Level2Status = 0
	GlobalVariables.Level3Status = 0
	GlobalVariables.CurrentLevel = 1
	GlobalVariables.GameStarted = 1
	get_tree().change_scene_to_file("res://Level Select/Level Select Screen.tscn")

func ContinueGame():
	get_tree().change_scene_to_file("res://Level Select/Level Select Screen.tscn")

func QuitGame():
	get_tree().quit()

func LoadGame():
	if not FileAccess.file_exists("user://savegame.save"):
		return #no save game detected.

	var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
	
	var json_str = save_game.get_as_text()
	save_game.close()
	
	var save_data = JSON.parse_string(json_str)
	if "YellowThreshold" in save_data:
		GlobalVariables.YellowThreshold = save_data["YellowThreshold"]
	if "RedThreshold" in save_data:
		GlobalVariables.RedThreshold = save_data["RedThreshold"]
	if "MaxState" in save_data:
		GlobalVariables.MaxState = save_data["MaxState"]
	if "StartRate" in save_data:
		GlobalVariables.StartRate = save_data["StartRate"]
	if "IncreaseRate" in save_data:
		GlobalVariables.IncreaseRate = save_data["IncreaseRate"]
	if "DecreaseRate" in save_data:
		GlobalVariables.DecreaseRate = save_data["DecreaseRate"]
	if "Score" in save_data:
		GlobalVariables.Score = save_data["Score"]
	if "TargetScore" in save_data:
		GlobalVariables.TargetScore = save_data["TargetScore"]
	if "CurrentLevel" in save_data:
		GlobalVariables.CurrentLevel = save_data["CurrentLevel"]
	if "Level1Status" in save_data:
		GlobalVariables.Level1Status = save_data["Level1Status"]
	if "Level1Objective" in save_data:
		GlobalVariables.Level1Objective = save_data["Level1Objective"]
	if "Level2Status" in save_data:
		GlobalVariables.Level2Status = save_data["Level2Status"]
	if "Level2Objective" in save_data:
		GlobalVariables.Level2Objective = save_data["Level2Objective"]
	if "Level3Status" in save_data:
		GlobalVariables.Level3Status = save_data["Level3Status"]
	if "Level3Objective" in save_data:
		GlobalVariables.Level3Objective = save_data["Level3Objective"]
	if "GameStarted" in save_data:
		GlobalVariables.GameStarted = save_data["GameStarted"]

func ClearDir(): #TODO: REMOVE FOR FINAL RELEASE
	if not FileAccess.file_exists("user://savegame.save"):
		return #no save game detected.
	var file_to_remove = "user://savegame.save"
	OS.move_to_trash(ProjectSettings.globalize_path(file_to_remove))

