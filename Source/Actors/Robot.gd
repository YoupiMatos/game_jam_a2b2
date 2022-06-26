extends KinematicBody2D


# Declare member variables here. Examples:
var player: Node
var speed= 150
var gravity = 1500
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_nodes_in_group("player")[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	velocity.y = gravity * delta
	velocity.x = global_position.direction_to(player.global_position).x * 100
	
	move_and_slide(velocity * speed * delta)
