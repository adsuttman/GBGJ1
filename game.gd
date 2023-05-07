extends Node2D

@onready var ball = $Ball

signal ball_touched_floor

func _physics_process(delta: float) -> void:
	if ball.position.y > 712:
		ball_touched_floor.emit()
