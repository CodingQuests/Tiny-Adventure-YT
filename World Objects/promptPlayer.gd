extends CanvasLayer



func _on_No_pressed():
	queue_free()

func _on_Yes_pressed():
	Quests.IntroQuest = true
	queue_free()
