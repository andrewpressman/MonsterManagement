extends Panel

func _ready():
	$Level1/BigInfo/Label.text = SetExperimentNumber(1) + Space() + SetCreature(1) + "\n" + "Threat Level:" + str(GlobalVariables.CurrentLevel) + Space() + SetNames(1) + Space() + SetDetails(1)
	$Level2/BigInfo/Label.text = SetExperimentNumber(2) + Space() + SetCreature(2) + "\n" + "Threat Level:" + str(GlobalVariables.CurrentLevel) + Space() + SetNames(2) + Space() + SetDetails(2)
	$Level3/BigInfo/Label.text = SetExperimentNumber(3) + Space() + SetCreature(3) + "\n" + "Threat Level:" + str(GlobalVariables.CurrentLevel) + Space() + SetNames(3) + Space() + SetDetails(3)
	
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
		FinalString = FinalString + " Anomaly " + str(GlobalVariables.CurrentLevel) + "0" + str(testNo)
		if GlobalVariables.CurrentLevel == 3:
			FinalString = FinalString + " : " + Lore.CreatureTypes[testNo - 1]
		elif GlobalVariables.CurrentLevel == 4:
			FinalString = FinalString + " : " + Lore.CreatureTypes[testNo + 2]
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
		FinalString = FinalString + "-" + Lore.ScientistNames[0] + "\n"
		FinalString = FinalString + "-" + Lore.ScientistNames[1] + "\n"
		FinalString = FinalString + "-" + Lore.ScientistNames[2] + "\n"
		
	else:
		FinalString = FinalString + "UNAVILABLE" + "\n"
		FinalString = FinalString + "UNAVILABLE" + "\n"
		FinalString = FinalString + "UNAVILABLE" + "\n"
	
	return FinalString

func SetDetails(testNo: int):
	var FinalString = "Details: "
	match GlobalVariables.CurrentLevel:
		1:
			FinalString += "-Training Simulation.\n -No further information required"
		2:
			match testNo:
				1:
					FinalString += " Anomaly contained to a controlled test enviroment"
				2:
					FinalString += " Anomaly contained to a controlled test enviroment"
				3:
					FinalString += " Anomaly contained to a controlled test enviroment"
		3:
			match testNo:
				1:
					FinalString += " Anomaly located in corporate office. Prior to activation subjects reported unusual behavior, most likly caused by temporary possession by anomaly.o"
				2:
					FinalString += " Anomaly located in suburban household. Subjects experiened auditory halucinations and mild paranoia."
				3:
					FinalString += " Anomaly discovred at Univeristy Campus. Reports indicated non-luminous objects emitting light for varied periods."
		4:
			match testNo:
				1:
					FinalString += " Anomaly contained. Noted effects include alteration of localized air pressure across a limited enviroment. Strength and scale TBD"
				2:
					FinalString += " Anomaly contained. Process unknown, anomaly causes localized earthquakes irrelevate to proxminity to any fault line. Highest recorded magniture is 3.4"
				3:
					FinalString += " Anomaly contained. Anomaly directly interfaces with any device capable of storing, charging or discharging electricity. Objects do not require power for interaction, further study required"
		5:
			FinalString += "DATA CORRUPTED... 01000100 01100101 01110011 01110100 01110010 01101111 01111001 "
			FinalString += 	"00100000 01101110 01100101 01111000 01110101 01110011 00100000 "
			FinalString += 	"01100010 01110010 01100101 01100001 01101011 00100000 01110100 "
			FinalString += 	"01101000 01100101 00100000 01100011 01101000 01100001 01101001 "
			FinalString += 	"01101110 01110011 00100000"
		_:
			FinalString += "FURTHER INFORMATION UNAVAILABLE"
	
	return FinalString


#add 2 line breaks
func Space():
	return "\n\n"
