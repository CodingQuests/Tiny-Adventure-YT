extends Button



var has_item = false
var itemIcon = preload("res://Player/Inventory/16x16/Miscs/bone01a.png")
var itemName = ""
var item_count



func _process(delta):
	if item_count == 0:
		get_node("Item").hide()
	if has_item == true:
		get_node("Item").texture = itemIcon
		get_node("Item").show()
	else:
		get_node("Item").hide()


func _on_Slot_pressed():
	var ItemInfo = get_node("../../ItemInfo")
	if has_item == true:

		ItemInfo.layer = 2
		ItemInfo.visible = !(ItemInfo.visible)
			
