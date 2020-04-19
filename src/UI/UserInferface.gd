extends Control

onready var scene_tree = get_tree()
onready var pause_overlay: ColorRect = get_node("PauseOverlay")
onready var score: Label = get_node("ScoreLbl")
onready var pause_title: Label = get_node("PauseOverlay/Title")
var paused: = false setget set_paused
#When UI is loaded
func _ready():
	PlayerData.connect("score_updated", self, "update_interface")
	PlayerData.connect("player_died", self, "_on_PlayerData_player_died")
	update_interface()

#When payer dies
func _on_PlayerData_player_died() -> void:
	self.paused = true
	pause_title.text = "You Died"

#Action called when pause is 'pressed'
func _unhandled_input(event: InputEvent):
	if (event.is_action_pressed("Pause")):
		self.paused = not paused
		scene_tree.set_input_as_handled()

#Sets state of variables when game is paused
func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value

#updates score
func update_interface() -> void:
	score.text = "Score: %s" % PlayerData.score