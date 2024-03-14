extends Panel

@export var bus_name : String
var bus_index : int

var GlobalSlider : HSlider
var DialogueSlider : HSlider
var ActionsSlider : HSlider
var AmbienceSlider : HSlider
var DisplayMode : OptionButton

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sound.visible = false
	$Video.visible = true
	GlobalSlider = $Sound/LabelGlobal/HSlider
	DialogueSlider = $Sound/LabelDialouge/HSlider
	ActionsSlider = $Sound/LabelActions/HSlider
	AmbienceSlider = $Sound/LabelAmbients/HSlider
	
	DisplayMode = $Video/DisplayMode

func Video():
	$Sound.visible = false
	$Video.visible = true
	
func Sound():
	$Sound.visible = true
	$Video.visible = false

func UpdateSettings():
	GlobalSlider.value = GlobalVariables.GlobalAudio
	DialogueSlider.value = GlobalVariables.Dialogue
	ActionsSlider.value = GlobalVariables.Actions
	AmbienceSlider.value = GlobalVariables.Ambience
	DisplayMode.selected = GlobalVariables.DisplayMode
	OnDisplayModeSelected(GlobalVariables.DisplayMode)

func OnGlobalVolumeChanged(value : float):
	GlobalVariables.GlobalAudio = value

func OnDialogueVolumeChanged(value : float):
	GlobalVariables.Dialogue = value

func OnActionsVolumeChanged(value : float):
	GlobalVariables.Actions = value
	
func OnAmbienceVolumeChanged(value : float):
	GlobalVariables.Ambience = value

func OnDisplayModeSelected(index):
	GlobalVariables.DisplayMode = index
	match index:
		0: #FullScreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		1: #Windowed
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			
