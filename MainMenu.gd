extends Node2D



func _ready():
	#Utils.save_game()
	Utils.load_game()
	
func _on_PlayBTN_pressed():
	if Game.FirstLaunch == false:
		get_tree().change_scene("res://CharacterSelect.tscn")
	else:
		get_tree().change_scene("res://World.tscn")
