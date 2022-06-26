extends StateMachine



func _ready():
	add_state("idle")
	add_state("run")
	add_state("jump")
	add_state("fall")
	add_state("wall_slide")
	call_deferred("_set_state", states.idle)

func _input(event):
	if [states.idle, states.run].has(state):
		if event.is_action_pressed("jump") && parent.is_on_floor():
			parent.jump_sound.play()
			parent.velocity.y = parent.jump_velocity
	if state == states.jump:
		if event.is_action_released("jump") && parent.velocity.y < parent.min_jump_velocity:
			parent.velocity.y = parent.min_jump_velocity
	elif state == states.wall_slide:
		if event.is_action_pressed("jump"):
			parent.jump_sound.play()
			parent.wall_jump()
			parent.begin_timer(parent.wall_direction)

func _state_logic(delta):
	parent._update_move_direction()
	parent._update_wall_direction()
	parent._handle_move_input()
	parent._apply_gravity(delta)
	if state== states.wall_slide:
		parent._cap_gravity_wall_slide()
	parent._apply_movement()

func _get_transition(delta):
	match state:
		states.idle:
			if !parent.is_on_floor():
				if parent.velocity.y < 0:
					return states.jump
				elif parent.velocity.y >= 0:
					return states.fall
			elif abs(parent.velocity.x) > 1 :
				return states.run
		
		states.run:
			if !parent.is_on_floor():
				if parent.velocity.y < 0:
					return states.jump
				elif parent.velocity.y > 0:
					return states.fall
			elif abs(parent.velocity.x) < 1:
				return states.idle
		
		states.jump:
			if parent.wall_direction != 0 && parent.get_timer(parent.wall_direction).time_left == 0:
				return states.wall_slide
			elif parent.is_on_floor():
				return states.idle
			elif parent.velocity.y >= 0:
				return states.fall
				
		states.fall:
			if parent.wall_direction != 0 && parent.get_timer(parent.wall_direction).time_left == 0:
				return states.wall_slide
			elif parent.is_on_floor():
				return states.idle
			elif parent.velocity.y < 0:
				return states.jump
				
		states.wall_slide:
			if parent.is_on_floor():
				return states.idle
			elif parent.wall_direction == 0:
				return states.fall
	
	return null

func _enter_state(new_state, old_state):
	match new_state:
		states.idle:
			pass
			parent.anim_player.play("idle")
		states.run:
			parent.anim_player.play("run")
		states.jump:
			parent.anim_player.play("jump")
		states.fall:
			parent.anim_player.play("fall")
		states.wall_slide:
			parent.anim_player.play("wall_slide")
			parent.sprites.scale.x = - parent.wall_direction

func _exit_state(old_state, new_state):
	pass
