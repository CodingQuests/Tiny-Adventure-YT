extends Node2D


func _process(delta):
	match Game.PlayerSelect:
		0:
			get_node("PlayerSelect").play("Player0")
			get_node("Des").text = "Gender: Male \nHair Color: Dark Blue"
		1:
			get_node("PlayerSelect").play("Player1")
			get_node("Des").text = "Gender: Female \nHair Color: Dark Blue"
		2:
			get_node("PlayerSelect").play("Player2")
			get_node("Des").text = "Gender: Male \nHair Color: Dark Blue"
		3:
			get_node("PlayerSelect").play("Player3")
			get_node("Des").text = "Gender: Female \nHair Color: Dark Blue"
		4:
			get_node("PlayerSelect").play("Player4")
			get_node("Des").text = "Gender: Male \nHair Color: Dark Blue"
		5:
			get_node("PlayerSelect").play("Player5")
			get_node("Des").text = "Gender: Female \nHair Color: Dark Blue"
func _on_Left_pressed():
	if Game.PlayerSelect > 0:
		Game.PlayerSelect -= 1

func _on_Right_pressed():
	if Game.PlayerSelect < 6:
		Game.PlayerSelect += 1


func _on_Select_pressed():
	get_tree().change_scene("res://World.tscn")
	Game.FirstLaunch = true
	Utils.save_game()
