extends RigidBody2D


# Declare member variables here. Examples:
var timer:Timer = Timer.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	timer.one_shot = true
	timer.wait_time = 8
	self.add_child(timer)
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer.time_left == 0:
		queue_free()


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		get_tree().reload_current_scene()
