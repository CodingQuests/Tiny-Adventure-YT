extends Panel


func _process(delta):
	if Quests.IntroQuest:
		if Quests.SkellyKilled == 5:
			get_node("Label").text = "Quest Complete!"
		else:
			get_node("Label").text = "Go Slay 5 Skeletons!    " + str(Quests.SkellyKilled) + "/5"
	else:
		get_node("Label").text = "Go find quest!"
	
