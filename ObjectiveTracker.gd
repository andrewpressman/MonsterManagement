extends Panel

var GameController: Node2D
var CurrObj : Label
var Objective : int
var objColor : ColorRect

var SecondaryObjectiveTxt : String

func _ready():
	objColor = $ObjStatus
	GameController = get_parent()
	CurrObj = $CurrObj
	GetCurrentLevel()
	
	$Objective.visible = false
	objColor.hide()
	CurrObj.hide()

func Startup():
	$Objective.visible = true
	await get_tree().create_timer(.1).timeout
	objColor.show()
	CurrObj.show()

#Sets/Stores all secondary objectives for each level (1 - 15)
func GetCurrentLevel():
	match GlobalVariables.CurrentLevel:
		1:
			GetStage(9,9,9) #intro levls, no obj
		2:
			GetStage(1,2,3) #eliminate 1,eliminate 2, eliminate3
		3:
			GetStage(6,7,8) #Preserve 1, Preserve 2, Preserve 3
		4:
			GetStage(4,4,4) #preserve all
		5:
			GetStage(5,5,5) #release the creatures

#Checks which stage is active and sets secondary objective
func GetStage(o1 : int, o2 : int, o3 : int):
	match GlobalVariables.CurrentStage:
		1:
			SetObjectiveText(o1)
			Objective = o1
		2:
			SetObjectiveText(o2)
			Objective = o2
		3:
			SetObjectiveText(o3)
			Objective = o3

#Set's the text of the secondary objective
func SetObjectiveText(obj : int):
	match obj:
		1:
			#kill only char 1
			SecondaryObjectiveTxt = "-Eliminate only Subject 1"
		2:
			#kill only char 2
			SecondaryObjectiveTxt = "-Eliminate only Subject 2"
		3:
			#kill only char 3
			SecondaryObjectiveTxt = "-Eliminate only Subject 3"
		4:
			#don't let any die
			SecondaryObjectiveTxt = "-Preserve all subjects"
		5:
			#release the creature without killing
			SecondaryObjectiveTxt = "-Release the creature\n-preserve all subjects"
		6:
			#Leave only char 1 alive
			SecondaryObjectiveTxt = "-Eliminate Subject 2\n-Eliminate Subject 3"
		7:
			#Leave only char 2 alive
			SecondaryObjectiveTxt = "-Eliminate Subject 1\n-Eliminate Subject 3"
		8:
			#Leave only char 3 alive
			SecondaryObjectiveTxt = "-Eliminate Subject 1\n-Eliminate Subject 2"
		9:
			#Just complete test
			SecondaryObjectiveTxt = ""
	
	CurrObj.text = SecondaryObjectiveTxt

#function to check if the ojbective conditions are met or not
func GetObjective():
	match Objective:
		1:
			#kill only char 1
			return OneDead(1)
		2:
			#kill only char 2
			return OneDead(2)
		3:
			#kill only char 3
			return OneDead(3)
		4:
			#don't let any die
			return AllAlive(true)
		5:
			#release the creature without killing
			return AllAlive(false)
		6:
			#Leave only char 1 alive
			return OneAlive(1)
		7:
			#Leave only char 2 alive
			return OneAlive(2)
		8:
			#Leave only char 3 alive
			return OneAlive(3)
		9:
			#Just complete test
			objColor.hide() #do not show status indicator when not needed
			return true

#ALl characters alive, True: keep all green, False: get monster to escape without killing
func AllAlive(type : bool):
	if type:
		if GameController.Character1 < GlobalVariables.MaxState && GameController.Character2 < GlobalVariables.MaxState && GameController.Character3 < GlobalVariables.MaxState && GameController.Monster < GlobalVariables.MaxState:
			objColor.modulate = Color(0,.5,0)
			return true
		else:
			objColor.modulate = Color(.5,0,0)
			return false
	else:
		if (GameController.Character1 < GlobalVariables.MaxState && GameController.Character2 < GlobalVariables.MaxState && GameController.Character3 < GlobalVariables.MaxState) && GameController.Monster >= GlobalVariables.MaxState:
			objColor.modulate = Color(0,.5,0)
			return true
		else:
			objColor.modulate = Color(.5,0,0)
			return false

#leave only 1 alive
func OneAlive(char : int):
	match char:
		1:
			if GameController.Character1 < GlobalVariables.MaxState && (GameController.Character2 >= GlobalVariables.MaxState && GameController.Character3 >= GlobalVariables.MaxState):
				objColor.modulate = Color(0,.5,0)
				return true
			else:
				objColor.modulate = Color(.5,0,0)
				return false
		2:
			if GameController.Character2 < GlobalVariables.MaxState && (GameController.Character1 >= GlobalVariables.MaxState && GameController.Character3 >= GlobalVariables.MaxState):
				objColor.modulate = Color(0,.5,0)
				return true
			else:
				objColor.modulate = Color(.5,0,0)
				return false
		3:
			if GameController.Character3 < GlobalVariables.MaxState && (GameController.Character1 >= GlobalVariables.MaxState && GameController.Character2 >= GlobalVariables.MaxState):
				objColor.modulate = Color(0,.5,0)
				return true
			else:
				objColor.modulate = Color(.5,0,0)
				return false

#kill only 1
func OneDead(char : int):
	match char:
		1:
			if GameController.Character1 >= GlobalVariables.MaxState && (GameController.Character2 < GlobalVariables.MaxState && GameController.Character3 < GlobalVariables.MaxState):
				objColor.modulate = Color(0,.5,0)
				return true
			else:
				objColor.modulate = Color(.5,0,0)
				return false
		2:
			if GameController.Character2 >= GlobalVariables.MaxState && (GameController.Character1 < GlobalVariables.MaxState && GameController.Character3 < GlobalVariables.MaxState):
				objColor.modulate = Color(0,.5,0)
				return true
			else:
				objColor.modulate = Color(.5,0,0)
				return false
		3:
			if GameController.Character3 >= GlobalVariables.MaxState && (GameController.Character1 < GlobalVariables.MaxState && GameController.Character2 < GlobalVariables.MaxState):
				objColor.modulate = Color(0,.5,0)
				return true
			else:
				objColor.modulate = Color(.5,0,0)
				return false
