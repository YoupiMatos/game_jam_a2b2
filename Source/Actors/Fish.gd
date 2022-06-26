extends Node2D


# Declare member variables here. Examples:
onready var anim_player = $Fish/AnimationPlayer
onready var hitbox = $Fish/CollisionShape2D

var ready = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if Autoload.level_2_corrupted:
			if anim_player.current_animation == "jump":
				anim_player.play("die")
				hitbox.disabled = true
	

func _on_Fish_body_entered(body):
	if body.is_in_group("player"):
		get_tree().reload_current_scene()


func _on_Fish_ready():
	ready = true
