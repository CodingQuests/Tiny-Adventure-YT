extends Node2D

var id;
var item_name;
var type;
var cost;
var hp;
var heal;
var skill;
var strength;
var agility;
var defence;
var intelligence;
var use;
var icon;
var description;
var path;

func _read_json_data(index, region, rarity, _type):
	var items_file = File.new();
	if not items_file.file_exists("res://Player/Inventory/Items.json"):
		return;
		
	items_file.open("res://Player/Inventory/Items.json", File.READ)
	
	var data = {};
	
	data = parse_json(items_file.get_as_text());
	#print(data);
	id = index;
	item_name = data[region][_type][rarity][str(index)]["name"];
	type = data[region][_type][rarity][str(index)]["type"];
	
	cost = data[region][_type][rarity][str(index)]["cost"];
	hp = data[region][_type][rarity][str(index)]["hp"];
	skill = data[region][_type][rarity][str(index)]["skill"];
	heal = data[region][_type][rarity][str(index)]["heal"];
	strength = data[region][_type][rarity][str(index)]["str"];
	agility = data[region][_type][rarity][str(index)]["agi"];
	defence = data[region][_type][rarity][str(index)]["def"];
	intelligence = data[region][_type][rarity][str(index)]["int"];
	use = data[region][_type][rarity][str(index)]["use"];
	icon = data[region][_type][rarity][str(index)]["icon"];
	description = data[region][_type][rarity][str(index)]["description"];
	path = data[region][_type][rarity][str(index)]["path"];
	
	items_file.close();
	pass;
	
	
func _print_data():
	pass;

func _get_id():
	return id;
	pass;

func _get_name():
	return item_name;
	pass;
	
func _get_stat(_stat):
	if _stat == "type":
		return type;
	elif _stat == "cost":
		return cost;
	elif _stat == "hp":
		return hp;
	elif _stat == "heal":
		return heal;
	elif _stat == "skill":
		return skill;
	elif _stat == "strength":
		return strength;
	elif _stat == "agility":
		return agility;
	elif _stat == "defence":
		return defence;
	elif _stat == "intelligence":
		return intelligence;
	elif _stat == "use":
		return use;
	elif _stat == "icon":
		return icon;
	elif _stat == "description":
		return description;
	elif _stat == "path":
		return path;
	pass;
