extends "res://src/Actors/Actor.gd"
#initial load function
func _ready():
	_velocity.x = -speed.x #moves left at the "speed" defined in the inspector
#physics handling function
func _physics_process(delta: float) -> void:
	if (is_on_wall()):
		_velocity.x *= -1.0 #turns enemy around if it hits a wall
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)