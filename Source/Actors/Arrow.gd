extends RigidBody2D


# Declare member variables here. Examples:
var timer:Timer = Timer.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	timer.one_shot = true
	timer.wait_time = 8
	self.add_child(timer)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer.time_left == 0:
		queue_free()
