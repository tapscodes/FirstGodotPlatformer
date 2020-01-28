extends Actor
func _physics_process(delta: float) -> void:
	##Detects Input + Sets Velocity
	var direction = get_direction()
	velocity = calculate_velocity(velocity, direction, speed)
	#Moves Character
	velocity = move_and_slide(velocity, FLOOR_NORMAL) 
func get_direction() -> Vector2:
	var dirX = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var dirY = -1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0
	return Vector2(dirX, dirY)
#Gets the velocity using the input and speed
func calculate_velocity(
linear_velocity: Vector2, 
direction: Vector2,
speed: Vector2
) -> Vector2:
	var new_velocity = linear_velocity
	new_velocity.x = speed.x * direction.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	if (direction.y == -1.0): #if a jump was detected
		new_velocity.y = speed.y * get_direction().y
	return new_velocity