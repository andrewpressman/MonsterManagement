extends Node

var MinState : int = 0

var YellowThreshold : int
var RedThreshold : int
var MaxState : int

var StartRate : int
var IncreaseRate : int
var DecreaseRate : int

#scoring and Secondary Objectve tracking
var Score : int = 0
var TargetScore : int
var SecondayObjective : int

#meta variables
var CurrentStage : int #track which set of 3 levels the player is at

#Leve status, 0 = incomplete, 1 = complete w/o objective, 2 = completed w/ objective 
var Level1Status : int 
var Level2Status : int
var Level3Status : int

