extends Node2D

var Continue : Button
var NewGame : Button
var Options : Button
var Quit : Button
var LevelSelect : Button


# Called when the node enters the scene tree for the first time.
func _ready():
	LoadGame()
	showEndings()
	Continue = $MainMenu/Continue
	NewGame = $"MainMenu/New Game"
	Options = $MainMenu/Options
	LevelSelect = $MainMenu/LevelSelect
	Quit = $MainMenu/Quit
	$OptionsMenu.UpdateSettings()
	$OptionsMenu.visible = false
	$LevelSelectPanel.visible = false
	$MainMenu/LevelSelect.visible = false
	$close.visible = false
	if GlobalVariables.GameStarted > 0:
		Continue.show()
		Continue.text = "Continue Shift " + str(GlobalVariables.CurrentLevel)
		if GlobalVariables.CurrentLevel > 5:
			Continue.text = "Continue Endless"
	else:
		Continue.hide()	
		
	if GlobalVariables.GameStarted > 1:
		$MainMenu/LevelSelect.visible = true

func showEndings():
	for ending in GlobalVariables.UnlockedEndings:
		if ending == 1:
			$Endings.text = $Endings.text + "★"

func StartNewGame():
	#clear Savegame
	GlobalVariables.Level1Status = 0
	GlobalVariables.Level2Status = 0
	GlobalVariables.Level3Status = 0
	GlobalVariables.CurrentLevel = 1
	GlobalVariables.GameStarted = 1
	$beeper.play()
	get_tree().change_scene_to_file("res://Level Select/Level Select Screen.tscn")

func ContinueGame():
	$beeper.play()
	get_tree().change_scene_to_file("res://Level Select/Level Select Screen.tscn")

func OptionsMenu(): 
	$beeper.play()
	$OptionsMenu.visible = !$OptionsMenu.visible
	$close.visible = !$close.visible
	$LevelSelectPanel.visible = false

func ShowLevelSelect(): 
	$beeper.play()
	if GlobalVariables.GameStarted > 1:
			$LevelSelectPanel.visible = !$LevelSelectPanel.visible
	$OptionsMenu.visible = false
	$close.visible = false

func QuitGame():
	$beeper.play()
	get_tree().quit()

#Load game from saveFile
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
	if "Level2Status" in save_data:
		GlobalVariables.Level2Status = save_data["Level2Status"]
	if "Level3Status" in save_data:
		GlobalVariables.Level3Status = save_data["Level3Status"]
	if "GameStarted" in save_data:
		GlobalVariables.GameStarted = save_data["GameStarted"]
	if "GlobalVolume" in save_data:
		GlobalVariables.GlobalAudio = save_data["GlobalVolume"]
	if "DialogueVolume" in save_data:
		GlobalVariables.Dialogue = save_data["DialogueVolume"]
	if "ActionsVolume" in save_data:
		GlobalVariables.Actions = save_data["ActionsVolume"]
	if "AmbienceVolume" in save_data:
		GlobalVariables.Ambience = save_data["AmbienceVolume"]
	if "DisplayMode" in save_data:
		GlobalVariables.DisplayMode = save_data["DisplayMode"]
	if "UnlockedLogs" in save_data:
		GlobalVariables.UnlockedLogs = save_data["UnlockedLogs"]
	if "HighScore" in save_data:
		GlobalVariables.HighScore = save_data["HighScore"]
	if "UnlockedEndings" in save_data:
		GlobalVariables.UnlockedEndings = save_data["UnlockedEndings"]

#func ClearDir(): Only for DEBUG purpoeses. Connect to PurgeSave button
#	if not FileAccess.file_exists("user://savegame.save"):
#		return #no save game detected.
#	var file_to_remove = "user://savegame.save"
#	OS.move_to_trash(ProjectSettings.globalize_path(file_to_remove))

func OnCreditsButtonPressed():
	$beeper.play()
	get_tree().change_scene_to_file("res://EndScreen/Credits.tscn")

#func UnlockAll(): Only for DEBUG purpoeses. Connect to UnlockEndlessButton
#		GlobalVariables.GameStarted = 2
#		GlobalVariables.UnlockedLogs = [1,1,1,1,1,1,1,1,1]

#Code for level switching post endgame
func Debug1():
	$beeper.play()
	GlobalVariables.CurrentLevel = 1
	Continue.text = "Continue Shift " + str(GlobalVariables.CurrentLevel)
	
func Debug2():
	$beeper.play()
	GlobalVariables.CurrentLevel = 2
	Continue.text = "Continue Shift " + str(GlobalVariables.CurrentLevel)
	
func Debug3():
	$beeper.play()
	GlobalVariables.CurrentLevel = 3
	Continue.text = "Continue Shift " + str(GlobalVariables.CurrentLevel)
	
func Debug4():
	$beeper.play()
	GlobalVariables.CurrentLevel = 4
	Continue.text = "Continue Shift " + str(GlobalVariables.CurrentLevel)
	
func Debug5():
	$beeper.play()
	GlobalVariables.CurrentLevel = 5
	Continue.text = "Continue Shift " + str(GlobalVariables.CurrentLevel)

func EndlessMode():
	$beeper.play()
	GlobalVariables.CurrentLevel = 6
	Continue.text = "Continue Endless"
	
#This game uses Godot Engine, available under the following license:

#Copyright (c) 2014-present Godot Engine contributors.
#Copyright (c) 2007-2014 Juan Linietsky, Ariel Manzur.

#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.
