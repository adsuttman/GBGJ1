extends Area2D

signal ball_entered



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		ball_entered.emit()
