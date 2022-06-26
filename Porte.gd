extends Node2D

onready var anim_player = $AnimationPlayer
onready var audio = $AudioStreamPlayer2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_nodes_in_group("player")[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		anim_player.play("open")
		audio.play()
