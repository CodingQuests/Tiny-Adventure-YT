extends KinematicBody2D

var speed = 30
var see_player = false
var direction = Vector2()
var health = 15
var damage = 5
var knockback_dir = Vector2.ZERO
var knockback = Vector2.ZERO
var HIT = preload("res://Global/HIT.tscn")
func _ready():
	
	get_node("HP").max_value = health
	get_node("HP").value = health
# warning-ignore:unused_argument
func _physics_process(delta):
	get_node("HP").value = health
	if health <= 0:
		Game.gain_experience(10)
		Game.Gold += 100
		queue_free()
		
	direction = Vector2.ZERO
	if see_player == true:
		var player = get_node("../../Friendly/Player")
		direction = (player.position - position).normalized()
		$AnimationTree.get("parameters/playback").travel("Walk")
		$AnimationTree.set("parameters/Idle/blend_position", direction)
		$AnimationTree.set("parameters/Walk/blend_position", direction)
# warning-ignore:return_value_discarded
		move_and_slide(speed*direction)
	else:
		$AnimationTree.get("parameters/playback").travel("Idle")
	knockback_dir = direction
	knockback = knockback.move_toward(Vector2.ZERO, 200*delta)
	knockback = move_and_slide(knockback)
	
func _on_Player_Check_body_entered(body):
	if body.name == "Player":
		see_player = true



func _on_Player_Check_body_exited(body):
	if body.name == "Player":
		see_player = false


func _on_PlayerDetect_area_entered(area):
	if "HostileDetect" in area.name:
		knockback = area.get_parent().knockback_dir*100
		var hit = HIT.instance()
		area.get_parent().add_child(hit)
		hit.show_value(str(damage), false)
