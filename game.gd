extends Node2D

@onready var ball = $Ball

signal ball_touched_floor
signal game_started

func _physics_process(delta: float) -> void:
	if ball.position.y > 712:
		ball_touched_floor.emit()

func display_game_over(score: String):
	$GameOver/GameOverText/Score.text = "Your score was: " + score
	$Pointer.hide()
	$GameOver.show()


func _on_ball_unfrozen() -> void:
	game_started.emit()


func _on_retry_pressed() -> void:
	get_tree().reload_current_scene()


func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
