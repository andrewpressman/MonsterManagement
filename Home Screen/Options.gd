extends Panel

@export var bus_name : String
var bus_index : int

var GlobalSlider : HSlider
var DialogueSlider : HSlider
var ActionsSlider : HSlider
var AmbienceSlider : HSlider


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSlider = $LabelGlobal/HSlider
	DialogueSlider = $LabelDialouge/HSlider
	ActionsSlider = $LabelActions/HSlider
	AmbienceSlider = $LabelAmbients/HSlider

func UpdateSettings():
	GlobalSlider.value = GlobalVariables.GlobalAudio
	DialogueSlider.value = GlobalVariables.Dialogue
	ActionsSlider.value = GlobalVariables.Actions
	AmbienceSlider.value = GlobalVariables.Ambience

func OnGlobalVolumeChanged(value : float):
	GlobalVariables.GlobalAudio = value

func OnDialogueVolumeChanged(value : float):
	GlobalVariables.Dialogue = value

func OnActionsVolumeChanged(value : float):
	GlobalVariables.Actions = value
	
func OnAmbienceVolumeChanged(value : float):
	GlobalVariables.Ambience = value
