extends Node2D

var Continue : Button
var NewGame : Button
var Options : Button
var Quit : Button


# Called when the node enters the scene tree for the first time.
func _ready():
	Continue = $MainMenu/Continue
	NewGame = $MainMenu/NewGame
	Options = $MainMenu/Options
	Quit = $MainMenu/Quit

func StartNewGame():
	#clear Savegame
	get_tree().change_scene_to_file("res://Level Select/Level Select Screen.tscn")

func ContinueGame():
	pass

func QuitGame():
	get_tree().quit()

