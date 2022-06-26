extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var anim_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		anim_player.play("dialogue")


func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):
		anim_player.play("bouboul")
