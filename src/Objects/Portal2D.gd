tool #Runs functions in editor
extends Area2D
onready var ani_player: AnimationPlayer = $AnimationPlayer #$ == get_node function
export var next_scene: PackedScene
#Makes warning if next_scene variable hasn't been set in editor
func _get_configuration_warning() -> String:
	return "Must set level for Portal2D" if not next_scene else ""

#When player entry is detected
func _on_body_entered(body):
	teleport()

#Transitions to 'next_scene'
func teleport() -> void:
	ani_player.play("fade_black")
	yield(ani_player, "animation_finished") #waits for 'animation_finished" signal from ani_player
	get_tree().change_scene_to(next_scene) #gets game 'tree' and changes the scene to portals scene
