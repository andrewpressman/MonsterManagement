extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func OnMenuButton():
	get_tree().change_scene_to_file("res://Home Screen/MainMenu.tscn")

func ShowHideLicensePanel():
	$Info.visible = !$Info.visible
	$Credits.visible = !$Credits.visible
