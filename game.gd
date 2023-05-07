extends Node2D

@onready var ball = $Ball

signal ball_touched_floor

func _physics_process(delta: float) -> void:
	if ball.position.y > 712:
		ball_touched_floor.emit()

func display_game_over(score: String):
	$GameOver/GameOverText/Score.text = "Your score was: " + score
	$GameOver.show()
