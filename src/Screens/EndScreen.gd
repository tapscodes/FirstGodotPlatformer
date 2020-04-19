extends Control

onready var label: Label = $Label
#When end screen is loaded
func _ready() -> void:
	label.text = label.text % [PlayerData.score, PlayerData.deaths]