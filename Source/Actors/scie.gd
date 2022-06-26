extends Area2D



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var is_static = false
onready var anim_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	if is_static:
		anim_player.play("static")
	else: anim_player.play("Idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_scie_body_entered(body):
	if body.is_in_group("player"):
		get_tree().reload_current_scene()
