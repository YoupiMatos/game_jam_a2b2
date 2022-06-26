extends Area2D


# Declare member variables here. Examples:
onready var anim_player = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Shop_body_entered(body):
	if body.is_in_group("player"):
		anim_player.play("dialogue")
		if Input.is_action_just_pressed("accept"):
			Autoload.level_1_corrupted = true
