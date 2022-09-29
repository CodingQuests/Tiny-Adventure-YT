extends CanvasLayer

var currhealth

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("HP").max_value = Game.Player_Max_HP
	get_node("HP").value = Game.Player_HP
	get_node("MP").max_value = Game.Player_Max_MP
	get_node("MP").value = Game.Player_MP
	
# warning-ignore:unused_argument
func _physics_process(delta):
	if currhealth != Game.Player_HP:
		get_node("HP/Tween").interpolate_property(get_node("HP"), "value", currhealth, Game.Player_HP, 0.5)
		get_node("HP/Tween").start()
	currhealth = Game.Player_HP
	get_node("HP").value = Game.Player_HP
	
