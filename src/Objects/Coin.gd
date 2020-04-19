extends Area2D

export var score: = 100
#Sets animation player when coin is spawned/loaded
onready var ani_player: AnimationPlayer = get_node("AnimationPlayer")
#When player touches the coin
func _on_body_entered(body):
	picked()

func picked() -> void:
	PlayerData.score += score
	ani_player.play("fade_out")
