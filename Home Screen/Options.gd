extends Panel

var GlobalSlider : HSlider
var DialougeSlider : HSlider
var ActionsSlider : HSlider
var AmbienceSlider : HSlider


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSlider = $LabelGlobal/HSlider
	DialougeSlider = $LabelDialouge/HSlider
	ActionsSlider = $LabelActions/HSlider
	AmbienceSlider = $LabelAmbients/HSlider

#Tutorial here: https://www.gdquest.com/tutorial/godot/audio/volume-slider/
