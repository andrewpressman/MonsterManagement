extends HSlider
@export
var bus_name : String

var bus_index : int
var text : Label

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	text = $Label
	
func onValueChanged(value : float) -> void:
		AudioServer.set_bus_volume_db(bus_index,linear_to_db(value))
		text.text = str(int(value * 100)) + "%"

