extends "res://src/Actors/Actor.gd"
#initial load function
func _ready():
	set_physics_process(false) #stops the physics process to start, starts with VisiblityEnabler2D
	_velocity.x = -speed.x #moves left at the "speed" defined in the inspector
#physics handling function
func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	if (is_on_wall()):
		_velocity.x *= -1.0 #turns enemy around if it hits a wall
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y #only the .y so x isn't reset to 0