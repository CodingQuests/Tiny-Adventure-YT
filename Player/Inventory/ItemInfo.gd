extends CanvasLayer


func _ready():
	self.hide()
	layer = -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Close_pressed():
	self.layer = -1
	self.visible = false
