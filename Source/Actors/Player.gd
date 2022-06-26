extends KinematicBody2D

# Declare member variables here. Examples:
const WALL_JUMP_VELOCITY = Vector2(1200, -720)

var dj_counter: int
var velocity = Vector2()
var move_speed = 600
var gravity = 1500
var jump_velocity = -720
var min_jump_velocity = -120
var is_grounded
var wall_direction = 1
var move_direction

onready var sprites = $Sprite
onready var anim_player = $AnimationPlayer
onready var raycasts = $Raycasts
onready var left_wj_timer = $WallJumpTimers/LeftTimer
onready var right_wj_timer = $WallJumpTimers/RightTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _cap_gravity_wall_slide():
	var max_velocity = 100 if !Input.is_action_pressed("down") else 6 * 96
	velocity.y = min(velocity.y, max_velocity)
	
func _apply_gravity(delta):
	velocity.y += gravity * delta
	
func _apply_movement():
	velocity = move_and_slide(velocity, Vector2.UP)
	
	is_grounded = _check_is_grounded()

func _update_move_direction():
	move_direction = int(Input.get_action_strength("right") - Input.get_action_strength("left"))

func _handle_move_input():
	velocity.x = lerp(velocity.x, move_speed * move_direction, _get_h_weight())
	if move_direction != 0 && wall_direction == 0:
		sprites.scale.x = move_direction

func _check_is_grounded():
	for raycast in raycasts.get_children():
		if raycast.is_colliding():
			return true
	return false

func _update_wall_direction():
	if is_on_wall():
		wall_direction = move_direction
	else:
		wall_direction = 0

func _get_h_weight():
	return 0.2 if is_grounded else 0.1
	
func wall_jump():
	var wall_jump_velocity = WALL_JUMP_VELOCITY
	wall_jump_velocity.x *= -wall_direction
	velocity = wall_jump_velocity
	
func begin_timer(wall_direction):
	if wall_direction == -1:
		left_wj_timer.start()
	elif wall_direction == 1:
		right_wj_timer.start()

func get_timer(wall_direction):
	if wall_direction == -1:
		return left_wj_timer
	elif wall_direction == 1:
		return right_wj_timer


#func _handle_move_input():
#	var is_jump_interrupted: = Input.is_action_just_released("jump") and velocity.y < 0.0
#	var direction = get_direction()
#	#sprite_mode(direction)
#	double_jump()
#	wall_jump()
#	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
#	_velocity = move_and_slide(_velocity, Vector2.UP)


func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interrupted: bool
	) -> Vector2:
	var out: = linear_velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	
	if direction.y == -1.0:
		out.y = speed.y * direction.y
	if is_jump_interrupted:
		out.y = 0
	return out

#func sprite_mode(direction: Vector2) -> void:
#	if direction.x == 1:
#		anim_player.play("move")
#		char_sprite.flip_h = false
#		melee_sprite.flip_h = false
#		melee_sprite.offset.x = 15
#		melee_hitbox.position.x = 15
#
#	elif direction.x == -1:
#		anim_player.play("move")
#		char_sprite.flip_h = true
#		melee_sprite.flip_h = true
#		melee_sprite.offset.x = -15
#		melee_hitbox.position.x = -15
#
#	elif direction.x == 0:
#		anim_player.play("idle")
#
#	if !is_on_floor() and _velocity.y < 0:
#		anim_player.play("jump_up")
#	elif !is_on_floor() and _velocity.y > 0:
#		anim_player.play("jump_down")
		
func double_jump():
	if is_on_floor():
		dj_counter = 1
	else:
		if Input.is_action_just_pressed("jump") and dj_counter > 0:
			dj_counter -= 1
