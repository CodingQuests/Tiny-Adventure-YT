extends Node


var IntroQuest = false
var SkellyKilled = 0



func _process(delta):
	if SkellyKilled > 5:
		SkellyKilled = 5
