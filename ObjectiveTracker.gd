extends Panel

var GameController: Node2D
var ObjCheck : bool
var CurrObj : Label

func _ready():
	ObjCheck = false
	GameController = get_parent()
	CurrObj = $CurrObj
	GetObjective(GlobalVariables.SecondayObjective)
	CurrObj.text = GlobalVariables.SecondayObjectiveTxt

func GetObjective(obj : int):
	match obj:
		1:
			#kill only char 1
			return OneAlive(1)
		2:
			#kill only char 2
			return OneAlive(2)
		3:
			#kill only char 3
			return OneAlive(3)
		4:
			#don't let any die
			return AllAlive(true)
		5:
			#release the creature without killing
			return AllAlive(false)
		6:
			#Leave only char 1 alive
			return OneDead(1)
		7:
			#Leave only char 2 alive
			return OneDead(2)
		8:
			#Leave only char 3 alive
			return OneDead(3)
		9:
			#Just complete test
			return true

#ALl characters alive, True: keep all green, False: get monster to escape without killing
func AllAlive(type : bool):
	if type:
		if GameController.Character1 < GlobalVariables.MaxState && GameController.Character2 < GlobalVariables.MaxState && GameController.Character3 < GlobalVariables.MaxState && GameController.Monster < GlobalVariables.MaxState:
			ObjCheck = true
		else:
			ObjCheck = false
	else:
		if (GameController.Character1 < GlobalVariables.MaxState && GameController.Character2 < GlobalVariables.MaxState && GameController.Character3 < GlobalVariables.MaxState) && GameController.Monster >= GlobalVariables.MaxState:
			ObjCheck = true
		else:
			ObjCheck = false
#leave only 1 alive
func OneAlive(char : int):
	match char:
		1:
			if GameController.Character1 < GlobalVariables.MaxState && (GameController.Character2 >= GlobalVariables.MaxState && GameController.Character3 >= GlobalVariables.MaxState):
				ObjCheck = true
			else:
				ObjCheck = false
		2:
			if GameController.Character2 < GlobalVariables.MaxState && (GameController.Character1 >= GlobalVariables.MaxState && GameController.Character3 >= GlobalVariables.MaxState):
				ObjCheck = true
			else:
				ObjCheck = false
		3:
			if GameController.Character3 < GlobalVariables.MaxState && (GameController.Character1 >= GlobalVariables.MaxState && GameController.Character2 >= GlobalVariables.MaxState):
				ObjCheck = true
			else:
				ObjCheck = false

#kill only 1
func OneDead(char : int):
	match char:
		1:
			if GameController.Character1 >= GlobalVariables.MaxState && (GameController.Character2 < GlobalVariables.MaxState && GameController.Character3 > GlobalVariables.MaxState):
				ObjCheck = true
			else:
				ObjCheck = false
		2:
			if GameController.Character2 >= GlobalVariables.MaxState && (GameController.Character1 < GlobalVariables.MaxState && GameController.Character3 < GlobalVariables.MaxState):
				ObjCheck = true
			else:
				ObjCheck = false
		3:
			if GameController.Character3 >= GlobalVariables.MaxState && (GameController.Character1 < GlobalVariables.MaxState && GameController.Character2 < GlobalVariables.MaxState):
				ObjCheck = true
			else:
				ObjCheck = false
