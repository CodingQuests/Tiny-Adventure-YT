extends CanvasLayer

onready var inventory = $Inventory
onready var slot_buttons = [
	get_node("SlotsContainer/Slot1Button"),
	get_node("SlotsContainer/Slot2Button"),
	get_node("SlotsContainer/Slot3Button"),
	get_node("SlotsContainer/Slot4Button"),
	get_node("SlotsContainer/Slot5Button"),
	get_node("SlotsContainer/Slot6Button"),
	get_node("SlotsContainer/Slot7Button"),
	get_node("SlotsContainer/Slot8Button"),
	get_node("SlotsContainer/Slot9Button"),
	get_node("SlotsContainer/Slot10Button"),
	get_node("SlotsContainer/Slot11Button"),
	get_node("SlotsContainer/Slot12Button"),
	get_node("SlotsContainer/Slot13Button"),
	get_node("SlotsContainer/Slot14Button"),
	get_node("SlotsContainer/Slot15Button"),
	get_node("SlotsContainer/Slot16Button"),
]


func _process(delta):
	if self.has_node("Inventory"):
		_get_inventory_items()
		
func _get_inventory_items():
	var keys = inventory._get_keys()
	for i in range(slot_buttons.size()):
		if i < keys.size():
			var item = inventory._get_item(keys[i])
			slot_buttons[i].itemIcon = load(item._get_stat("icon"))
			slot_buttons[i].itemName = item._get_stat("name")
			slot_buttons[i].has_item = true
		else:
			slot_buttons[i].has_item = false

