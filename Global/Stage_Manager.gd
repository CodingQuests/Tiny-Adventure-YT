extends CanvasLayer



const MainMenu = "res://MainMenu.tscn"
const MainWorld = "res://World.tscn"
const GameOver = "res://GameOver.tscn"
const CharacterSelect = "res://CharacterSelect.tscn"

func change_stage(stage_path):
	get_node("ColorRect").show()
	
	var older_layer = layer
	layer = 5
	get_node("AnimationPlayer").play("Fade In")
	yield(get_node("AnimationPlayer"), "animation_finished")
	
	get_tree().change_scene(stage_path)
	layer = older_layer
	get_node("AnimationPlayer").play("Fade Out")
	
