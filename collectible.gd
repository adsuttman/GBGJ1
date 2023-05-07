extends Area2D
class_name Collectible

signal ball_entered(transform: Transform2D)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		ball_entered.emit(transform)
		queue_free()
