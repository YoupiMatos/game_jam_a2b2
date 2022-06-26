extends Area2D


# Declare member variables here. Examples:
onready var sprite = $Sprite


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Autoload.level_2_corrupted:
			sprite.modulate = Color("5c2366")
