extends Node2D



func _ready():
	#Utils.save_game()
	Utils.load_game()
	
func _on_PlayBTN_pressed():
	Click.play_click()
	if Game.FirstLaunch == false:
		StageManager.change_stage(StageManager.CharacterSelect)
	else:
		StageManager.change_stage(StageManager.MainWorld)


func _on_Quit_pressed():
	Click.play_click()
	get_tree().quit()


func _on_Options_pressed():
	Click.play_click()
