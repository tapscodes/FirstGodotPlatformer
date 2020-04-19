tool
extends Button

export(String, FILE) var next_scene_path: = ""
#Warns user for not having a scene set
func _get_configuration_warning() -> String:
	return "Next scene must be set for button" if (next_scene_path == "") else ""	

#When button has been pressed
func _on_button_up():
	PlayerData.reset()
	get_tree().paused = false
	get_tree().change_scene(next_scene_path)
