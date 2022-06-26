extends Area2D


# Declare member variables here. Examples:
onready var anim_player = $AnimationPlayer
onready var sound = $AudioStreamPlayer2D
var timer:Timer = Timer.new()
const arrow = preload("res://Source/Actors/Arrow.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.one_shot = true
	timer.wait_time = 3
	self.add_child(timer)
	
#-18, 28

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer.time_left == 0:
		anim_player.play("attack")
		
		
func _on_AnimationPlayer_animation_finished(anim_name):
	var arrow_instance = arrow.instance()
	arrow_instance.position = $ArrowPos.position
	if scale.x >= 1:
		arrow_instance.apply_impulse(Vector2.RIGHT, Vector2(1250, 0))
	else:
		arrow_instance.apply_impulse(Vector2.LEFT, Vector2(-1250, 0))
	self.add_child(arrow_instance)
	sound.play()
	timer.start()
