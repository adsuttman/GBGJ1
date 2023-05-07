extends Node2D

@onready var game = $Game
@onready var label = $UI/Score
@onready var UI = $UI
var score: int = 0

func spawn_collectible():
	pass


func _on_game_ball_touched_floor() -> void:
	UI.hide()
	game.display_game_over(String.num(score) + " points")


func _on_game_game_started() -> void:
	spawn_collectible()
	label.show()
