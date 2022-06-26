extends Area2D


# Declare member variables here. Examples:
onready var anim_player = $AnimationPlayer
onready var hitbox = $CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if anim_player.current_animation == "idle":
		if Autoload.level_1_corrupted:
			anim_player.play("die")
			hitbox.disabled = true


func _on_Plante_body_entered(body):
	if body.is_in_group("player"):
		get_tree().reload_current_scene()
