extends Area2D

@export var gravity_increase: Vector2





func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		body.add_constant_central_force(gravity_increase)



func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("ball"):
		body.add_constant_central_force(-gravity_increase)
