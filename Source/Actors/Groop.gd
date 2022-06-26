extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var anim_player = $AnimationPlayer
onready var dialogue = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		if Autoload.level_1_corrupted:
			dialogue.text = "WHY ARE THE PLANTS WEIRD"
		else:
			dialogue.text = "I LOVE PLANTS"
		anim_player.play("dialogue")


func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):
		anim_player.play("anim")
