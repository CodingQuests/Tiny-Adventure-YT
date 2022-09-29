extends KinematicBody2D

var HIT = preload("res://Global/HIT.tscn")
export (int) var speed = 80
var attacking = false
var knockback_dir = Vector2.ZERO
var knockback = Vector2.ZERO
############################
var dash_object = preload("res://Player/Dash.tscn")
var dash_speed = 1000
var dash_length = 0.15
onready var sprite = get_node("Walk")
var is_dashing = false

func _physics_process(delta):
	if Game.Player_HP <= 0:
# warning-ignore:return_value_discarded
		StageManager.change_stage(StageManager.GameOver)
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
		if get_node("SwordEffect").playing == false:
			get_node("SwordEffect").play()
		attacking = true
		show_Sprite("Attack")
		$AnimationTree.get("parameters/playback").travel("Attack")
	if Input.is_action_just_pressed("Dash"):
		var tween1 = get_node("Tween")
		var direction = ($AnimationTree.get("parameters/Idle/blend_position"))
		tween1.interpolate_property(self, "position", position ,position + direction*50, 0.1, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		tween1.start()
		is_dashing = true
		yield(get_node("Tween"), "tween_all_completed")
		is_dashing = false
	if (is_dashing):
		var dash_node = dash_object.instance()
		#dash_node.texture = sprite.get_frame(sprite.animation,sprite.frame)
		var direction = ($AnimationTree.get("parameters/Idle/blend_position"))
		dash_node.direction = direction
		dash_node.global_position = global_position
		get_parent().add_child(dash_node)
		
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
