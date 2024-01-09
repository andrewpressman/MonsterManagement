extends Node

var MinState : int = 0 #minimum state for each entitiy

var YellowThreshold : int #Character turns yellow when hitting this value
var RedThreshold : int #Character turns red when hitting this value
var MaxState : int ##Character is dead/escaped when hitting/passing this value

var StartRate : int #base value for increasing/decreasing charater state (stays static)
var IncreaseRate : int #determines how much to increase a character value(variable)
var DecreaseRate : int #determines how much to decrease a character value(variable)

#scoring and Secondary Objectve tracking
var Score : int = 0 #starting score
var TargetScore : int #Score needed to win

#meta variables
var CurrentStage : int #track which set of 3 levels the player is at
var CurrentLevel : int #track which of the 15 levels the player is curerntly on

#Level status, 0 = incomplete, 1 = complete w/o objective, 2 = completed w/ objective 
var Level1Status : int 
var Level2Status : int
var Level3Status : int

#Level Objectives, 1 - 9
var Level1Objective : int 
var Level2Objective : int
var Level3Objective : int
