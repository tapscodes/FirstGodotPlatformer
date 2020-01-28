extends Actor
func _physics_process(delta: float) -> void:
	##Detects Input + Sets _velocity
	var is_jump_interrupted: =  Input.is_action_just_released("jump") and _velocity.y < 0 
	var direction: = get_direction()
	_velocity = calculate_velocity(_velocity, direction, speed, is_jump_interrupted)
	#Moves Character
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL) 
func get_direction() -> Vector2:
	var dirX = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var dirY = -1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0
	return Vector2(dirX, dirY)
#Gets the _velocity using the input and speed
func calculate_velocity(
linear_velocity: Vector2, 
direction: Vector2,
speed: Vector2,
is_jump_interrupted: bool
) -> Vector2:
	var movement_velocity = linear_velocity
	movement_velocity.x = speed.x * direction.x
	movement_velocity.y += gravity * get_physics_process_delta_time()
	if (direction.y == -1.0): #if a jump was detected
		movement_velocity.y = speed.y * get_direction().y
	if (is_jump_interrupted): #if a jump was stopped
		movement_velocity.y = 0
	return movement_velocity