extends Node

var MinState : int = 0 #minimum state for each entitiy

var YellowThreshold : int #Character turns yellow when hitting this value
var RedThreshold : int #Character turns red when hitting this value
var MaxState : int #Character is dead/escaped when hitting/passing this value

var StartRate : int #base value for increasing/decreasing charater state (stays static)
var IncreaseRate : int #determines how much to increase a character value(variable)
var DecreaseRate : int #determines how much to decrease a character value(variable)

#scoring and Secondary Objectve tracking
var Score : int = 0 #starting score
var TargetScore : int #Score needed to win
var PowerState : bool #track if power is On (true) or Off (false)
var HighScore : int = 0 #Tracks a user's high score

#meta variables
var CurrentStage : int #track which set of 3 levels the player is at
var CurrentLevel : int #track which of the 5 levels the player is curerntly on

#Level status, 0 = incomplete, 1 = complete w/o objective, 2 = completed w/ objective 
var Level1Status : int 
var Level2Status : int
var Level3Status : int

#Track which logs have been unlocked
var UnlockedLogs = [0,0,0,0,0,0,0,0,0]

#GameisOn
var GameStarted : int = 0
#Track if a level message has been plyed yet
var MessagePlayed : bool = false


#Audio settings
var GlobalAudio : float = 1
var Dialogue : float = 1
var Actions : float = 1
var Ambience : float = 1
var Subtitles : bool = false

#video settings
var DisplayMode : int = 1

