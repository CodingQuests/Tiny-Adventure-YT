extends Node


var PlayerSelect = 0
var FirstLaunch = false

var Player_HP = 50
var Player_Max_HP = 100
var Player_MP = 5
var Player_Max_MP = 10

var Player_Damage = 3
var player_lvl = 1
var experience = 0
var experience_total = 0
var experience_required = get_required_experience(player_lvl + 1)

var Gold = 0

func get_required_experience(Player_lvl):
	return round(pow(Player_lvl, 2.5) + Player_lvl*4)
	
func gain_experience(amount):
	experience_total += amount
	experience += amount
	var growth_data = []
	while experience >= experience_required:
		experience -= experience_required
		growth_data.append([experience_required, experience_required])
		Level_up()
	
	growth_data.append([experience, get_required_experience(player_lvl + 1)])
	emit_signal("experience_gained", growth_data)

func Level_up():
	player_lvl += 1
	experience_required = get_required_experience(player_lvl + 1)
	Player_Max_HP += 10
