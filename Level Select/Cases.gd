extends Panel

#TODO: move away from random numbers to maintain consistency

func _ready():
	$Level1/BigInfo/Label.text = SetExperimentNumber(1) + Space() + SetCreature() + "\n" + "Threat Level:" + str(GlobalVariables.CurrentLevel) + Space() + SetNames(1) + Space() + "Further Information Unavailable"
	$Level2/BigInfo/Label.text = SetExperimentNumber(2) + Space() + SetCreature() + "\n" + "Threat Level:" + str(GlobalVariables.CurrentLevel) + Space() + SetNames(2) + Space() + "Further Information Unavailable"
	$Level3/BigInfo/Label.text = SetExperimentNumber(3) + Space() + SetCreature() + "\n" + "Threat Level:" + str(GlobalVariables.CurrentLevel) + Space() + SetNames(3) + Space() + "Further Information Unavailable"
	
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
			
#Selects creature name from pre-set list
func SetCreature():
	var FinalString = "Creature ID: "
	if GlobalVariables.CurrentLevel < 15:
		var randomIndex = randi() % Lore.CreatureTypes.size()
		return FinalString + Lore.CreatureTypes[randomIndex]
	else:
		return FinalString + "REDACTED"

#Selects subject names from pre-set list
func SetNames(testNo : int):
	var FinalString = "Subject Names:\n" 
	var randomIndex1 = randi() % (Lore.Subject1Names.size() / 3)
	var randomIndex2 = randi() % (Lore.Subject2Names.size() / 3)
	var randomIndex3 = randi() % (Lore.Subject3Names.size() / 3)
	
	var randomIndex4 = randi() % (Lore.Scientist1Name.size() / 3)
	var randomIndex5 = randi() % (Lore.Scientist2Name.size() / 3)
	var randomIndex6 = randi() % (Lore.Scientist3Name.size() / 3)
	
	if GlobalVariables.CurrentLevel <= 5: #Tests 1-5 Characters are labeled as Unit ###
		testNo -= 1
		FinalString = FinalString + " Unit " + str(GlobalVariables.CurrentLevel) + "0" + str((testNo * 3) + 1) + "\n"
		FinalString = FinalString + " Unit " + str(GlobalVariables.CurrentLevel) + "0" + str((testNo * 3) + 2)  + "\n"
		FinalString = FinalString + " Unit " + str(GlobalVariables.CurrentLevel) + "0" + str((testNo * 3) + 3)
	
	elif GlobalVariables.CurrentLevel <= 10: #Tests 6-10 Characters are random names
		if randomIndex1 > 0:
			FinalString = FinalString + "-" + Lore.Subject1Names[randomIndex1 * testNo] + "\n"
		else:
			FinalString = FinalString + Lore.Subject1Names[(randomIndex1 + 1 * testNo) - 1] + "\n"
		if randomIndex2 > 0:
			FinalString = FinalString + "-" + Lore.Subject1Names[randomIndex2 * testNo] + "\n"
		else:
			FinalString = FinalString + Lore.Subject1Names[(randomIndex2 + 1 * testNo) - 1] + "\n"
		if randomIndex3 > 0:
			FinalString = FinalString + "-" + Lore.Subject3Names[randomIndex3 * testNo] + "\n"
		else:
			FinalString = FinalString + Lore.Subject3Names[(randomIndex3 + 1 * testNo) - 1] + "\n"	
	
	elif GlobalVariables.CurrentLevel <= 10: #Tests 11-14 Characters are scientists
		if randomIndex4 > 0:
			FinalString = FinalString + "-" + Lore.Scientist1Names[randomIndex1 * testNo] + "\n"
		else:
			FinalString = FinalString + Lore.Scientist1Names[(randomIndex1 + 1 * testNo) - 1] + "\n"
		if randomIndex5 > 0:
			FinalString = FinalString + "-" + Lore.Scientist1Names[randomIndex2 * testNo] + "\n"
		else:
			FinalString = FinalString + Lore.Scientist1Names[(randomIndex2 + 1 * testNo) - 1] + "\n"
		if randomIndex6 > 0:
			FinalString = FinalString + "-" + Lore.Scientist3Names[randomIndex3 * testNo] + "\n"
		else:
			FinalString = FinalString + Lore.Scientist3Names[(randomIndex3 + 1 * testNo) - 1] + "\n"	
	
	else: #Characters are employees
		FinalString = FinalString + " Employee 153866 \n Employee 153374 \n Employee 153759" 
	
	return FinalString
#add 2 line breaks
func Space():
	return "\n\n"
