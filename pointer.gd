extends Node2D

func _physics_process(delta: float) -> void:
	var mouse_position = get_viewport().get_mouse_position()
	position = mouse_position
