extends Node

onready var inventory = get_parent().get_node("Inventory");

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		get_node("../Inventory")._save_inventory_data()
	if event.is_action_pressed("Inv"):
		get_parent().visible = !(get_parent().visible)
		get_node("../Inventory")._save_inventory_data()


func _on_Slot1Button_pressed(extra_arg_0):
	var ItemInfo = get_node("../ItemInfo")
	if ItemInfo.layer < 0:
		var keys = inventory._get_keys();
		if keys.size() > extra_arg_0:
			var item = inventory._get_item(keys[extra_arg_0]);
			ItemInfo.get_node("Sprite").texture = load(item._get_stat("icon"))
			ItemInfo.get_node("Name").text = str(keys[extra_arg_0]) + "\n";
			#get_node("../ItemInfo")._itemCount = inventory._get_item_count(keys[extra_arg_0])
			ItemInfo.get_node("Des").text =  str(item._get_stat("description")) + "\n";
			
