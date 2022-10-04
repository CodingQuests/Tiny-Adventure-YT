extends StaticBody2D


onready var anim = get_node("AnimationPlayer")
onready var playerUI = get_node("../../../UI")
const prompt = preload("res://World Objects/promptPlayer.tscn")

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	
func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_tree().paused = true
		anim.play("Intro")
		


func promptPlayer():
	if Quests.IntroQuest == false:
		var promptPlayer1 = prompt.instance()
		promptPlayer1.get_node("Label").text = "Would you like to accept this quest of mine?"
		playerUI.add_child(promptPlayer1)
	else:
		anim.play("Ending")
	get_tree().paused = false
