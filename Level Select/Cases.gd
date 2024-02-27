extends Panel

#TODO: move away from random numbers to maintain consistency

func _ready():
	$Level1/BigInfo/Label.text = SetExperimentNumber(1) + Space() + SetCreature(1) + "\n" + "Threat Level:" + str(GlobalVariables.CurrentLevel) + Space() + SetNames(1) + Space() + "Further Information Unavailable"
	$Level2/BigInfo/Label.text = SetExperimentNumber(2) + Space() + SetCreature(2) + "\n" + "Threat Level:" + str(GlobalVariables.CurrentLevel) + Space() + SetNames(2) + Space() + "Further Information Unavailable"
	$Level3/BigInfo/Label.text = SetExperimentNumber(3) + Space() + SetCreature(3) + "\n" + "Threat Level:" + str(GlobalVariables.CurrentLevel) + Space() + SetNames(3) + Space() + "Further Information Unavailable"
	
#Sets test number based on Current level + random big nubmer cus fun
func SetExperimentNumber(testNo : int):
	var ExpNumber = GlobalVariables.CurrentLevel * 39283274092
	var FinalString = "Experiment Number: "
	match testNo:
		1:
			return FinalString + str(ExpNumber * 3)
		2:
			return FinalString + str(ExpNumber * 6)
		3:
			return FinalString + str(ExpNumber * 9)
			
#Sets Creature name and number
func SetCreature(testNo : int):
	var FinalString = "Creature ID: "
	#Level 1-2: just Anomaly + number
	#Level 3-4: Anomaly + number + name
	#Level 5: REDACTED
	if GlobalVariables.CurrentLevel < 5:
		FinalString = FinalString + " Aonomaly " + str(GlobalVariables.CurrentLevel) + "0" + str(testNo)
		if GlobalVariables.CurrentLevel > 2:
			FinalString = FinalString + " : " + Lore.CreatureTypes[testNo - 1]
	else:
		FinalString = "REDACTED"

	return FinalString

#Selects subject names from pre-set list
func SetNames(testNo : int):
	var FinalString = "Subject Names:\n" 
	testNo -= 1
	
	if GlobalVariables.CurrentLevel <= 2: #Level 1 & 2 chacters are labeled as Unit ###
		FinalString = FinalString + " Unit " + str(GlobalVariables.CurrentLevel) + "0" + str((testNo * 3) + 1) + "\n"
		FinalString = FinalString + " Unit " + str(GlobalVariables.CurrentLevel) + "0" + str((testNo * 3) + 2)  + "\n"
		FinalString = FinalString + " Unit " + str(GlobalVariables.CurrentLevel) + "0" + str((testNo * 3) + 3)
	
	elif GlobalVariables.CurrentLevel == 3: #Level 3 Characters are random names
		match testNo:
			0:
				FinalString = FinalString + "-" + Lore.Subject1Names[testNo] + "\n"
				FinalString = FinalString + "-" + Lore.Subject2Names[testNo] + "\n"
				FinalString = FinalString + "-" + Lore.Subject3Names[testNo] + "\n"
			1:
				FinalString = FinalString + "-" + Lore.Subject1Names[testNo] + "\n"
				FinalString = FinalString + "-" + Lore.Subject2Names[testNo] + "\n"
				FinalString = FinalString + "-" + Lore.Subject3Names[testNo] + "\n"
			2:
				FinalString = FinalString + "-" + Lore.Subject1Names[testNo] + "\n"
				FinalString = FinalString + "-" + Lore.Subject2Names[testNo] + "\n"
				FinalString = FinalString + "-" + Lore.Subject3Names[testNo] + "\n"

	elif GlobalVariables.CurrentLevel == 4: #Level 4 Characters are employees
		match testNo:
			0:
				FinalString = FinalString + "-" + Lore.Employee1Numbers[testNo] + "\n"
				FinalString = FinalString + "-" + Lore.Employee2Numbers[testNo] + "\n"
				FinalString = FinalString + "-" + Lore.Employee3Numbers[testNo] + "\n"
			1:
				FinalString = FinalString + "-" + Lore.Employee1Numbers[testNo] + "\n"
				FinalString = FinalString + "-" + Lore.Employee2Numbers[testNo] + "\n"
				FinalString = FinalString + "-" + Lore.Employee3Numbers[testNo] + "\n"
			2:
				FinalString = FinalString + "-" + Lore.Employee1Numbers[testNo] + "\n"
				FinalString = FinalString + "-" + Lore.Employee2Numbers[testNo] + "\n"
				FinalString = FinalString + "-" + Lore.Employee3Numbers[testNo] + "\n"
	
	elif GlobalVariables.CurrentLevel == 5: #Level 5 Characters are scientists
		match testNo:
			0:
				FinalString = FinalString + "-" + Lore.Scientist1Names[testNo] + "\n"
				FinalString = FinalString + "-" + Lore.Scientist2Names[testNo] + "\n"
				FinalString = FinalString + "-" + Lore.Scientist3Names[testNo] + "\n"
			1:
				FinalString = FinalString + "-" + Lore.Scientist1Names[testNo] + "\n"
				FinalString = FinalString + "-" + Lore.Scientist2Names[testNo] + "\n"
				FinalString = FinalString + "-" + Lore.Scientist3Names[testNo] + "\n"
			2:
				FinalString = FinalString + "-" + Lore.Scientist1Names[testNo] + "\n"
				FinalString = FinalString + "-" + Lore.Scientist2Names[testNo] + "\n"
				FinalString = FinalString + "-" + Lore.Scientist3Names[testNo] + "\n"
	
	return FinalString

#add 2 line breaks
func Space():
	return "\n\n"
