extends Panel

var p1 : Panel
var p2 : Panel
var p3 : Panel
var p4 : Panel
var p5 : Panel

func _ready():
	p1 = $P1
	p2 = $P2
	p3 = $P3
	p4 = $P4
	p5 = $P5
	
	p1.modulate = Color(0,0,0)
	p2.modulate = Color(0,0,0)
	p3.modulate = Color(0,0,0)
	p4.modulate = Color(0,0,0)
	p5.modulate = Color(0,0,0)

#fill 1 progress bad whenever 1/5 of the targetScore is reached
func UpdateScore():
	var interval = GlobalVariables.TargetScore / 5
	if GlobalVariables.Score > interval:
		p1.modulate = Color(0,1,0)
	if GlobalVariables.Score > interval * 2:
		p2.modulate = Color(0,1,0)
	if GlobalVariables.Score > interval * 3:
		p3.modulate = Color(0,1,0)
	if GlobalVariables.Score > interval * 4:
		p4.modulate = Color(0,1,0)
	if GlobalVariables.Score > interval * 5:
		p5.modulate = Color(0,1,0)
