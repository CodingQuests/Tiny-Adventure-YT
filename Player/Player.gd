extends KinematicBody2D

var HIT = preload("res://Global/HIT.tscn")
export (int) var speed = 80
var attacking = false
var knockback_dir = Vector2.ZERO
var knockback = Vector2.ZERO

func _physics_process(delta):
	if Game.Player_HP <= 0:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://GameOver.tscn")
	check_input()
	knockback = knockback.move_toward(Vector2.ZERO, 200*delta)
	knockback = move_and_slide(knockback)
	
func show_Sprite(sprite_name):
	get_node("Idle").hide()
	get_node("Walk").hide()
	get_node("Attack").hide()
	match sprite_name:
		"Idle":
			get_node("Idle").show()
		"Walk":
			get_node("Walk").show()
		"Attack":
			get_node("Attack").show()
func check_input():
	if attacking == false:
		var input_vector = Vector2.ZERO
		input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left") 
		input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up") 
		input_vector = input_vector.normalized()
		
		if input_vector == Vector2.ZERO:
			$AnimationTree.get("parameters/playback").travel("Idle")
			show_Sprite("Idle")
		else:
			$AnimationTree.get("parameters/playback").travel("Walk")
			show_Sprite("Walk")
			$AnimationTree.set("parameters/Idle/blend_position", input_vector)
			$AnimationTree.set("parameters/Walk/blend_position", input_vector)
			$AnimationTree.set("parameters/Attack/blend_position", input_vector)
			
# warning-ignore:return_value_discarded
			move_and_slide(input_vector*speed)
		
		knockback_dir = input_vector
	if Input.is_action_just_pressed("Attack"):
		attacking = true
		show_Sprite("Attack")
		$AnimationTree.get("parameters/playback").travel("Attack")

func Attack_finished():
	attacking = false



func _on_HostileDetect_area_entered(area):
	if "PlayerDetect" in area.name:
		Game.Player_HP -= area.get_parent().damage
		knockback = area.get_parent().knockback_dir*150

func _on_Attack_Detector_area_entered(area):
	if "PlayerDetect" in area.name:
		area.get_parent().knockback = -area.get_parent().knockback_dir*100
		area.get_parent().health -= Game.Player_Damage
		var hit = HIT.instance()
		area.get_parent().add_child(hit)
		hit.show_value(str(Game.Player_Damage), false)
