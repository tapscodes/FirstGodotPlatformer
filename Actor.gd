extends KinematicBody2D
class_name Actor
var velocity: = Vector2.ZERO
const FLOOR_NORMAL: = Vector2.UP #Used to help move_and_slide properly do gravity
export var speed = Vector2(300, 1000)
export var gravity: = 3000.0
#processes anything relating to physics
func _physics_process(delta: float) -> void:
	#delta to make it frame-rate independant
	velocity.y += gravity * delta