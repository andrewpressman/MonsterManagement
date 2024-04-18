extends Panel

var GlobalSlider : HSlider
var DialogueSlider : HSlider
var ActionsSlider : HSlider
var AmbienceSlider : HSlider
var DisplayMode : OptionButton
var Subtitles : OptionButton

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sound.visible = false
	$Video.visible = true
	GlobalSlider = $Sound/LabelGlobal/HSlider
	DialogueSlider = $Sound/LabelDialouge/HSlider
	ActionsSlider = $Sound/LabelActions/HSlider
	AmbienceSlider = $Sound/LabelAmbients/HSlider
	
	DisplayMode = $Video/DisplayMode
	Subtitles = $Video/Subtitles

func Video():
	$Sound.visible = false
	$Video.visible = true
	
func Sound():
	$Sound.visible = true
	$Video.visible = false

#Saves settings to global variables
func UpdateSettings():
	GlobalSlider.value = GlobalVariables.GlobalAudio
	DialogueSlider.value = GlobalVariables.Dialogue
	ActionsSlider.value = GlobalVariables.Actions
	AmbienceSlider.value = GlobalVariables.Ambience
	DisplayMode.selected = GlobalVariables.DisplayMode
	OnDisplayModeSelected(GlobalVariables.DisplayMode)
	if GlobalVariables.Subtitles:
		Subtitles.selected = 1
		OnSubtitlesSelected(1)
	else:
		Subtitles.selected = 0
		OnSubtitlesSelected(0)

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
			
func OnSubtitlesSelected(index):
	match index:
		0: #Off
			GlobalVariables.Subtitles = false
		1: #On
			GlobalVariables.Subtitles = true
			
