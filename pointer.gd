extends Node2D
@onready var shove_area: Area2D = $ShoveArea
@export var ball: RigidBody2D
@export var shove_strength: float = 500

func _physics_process(delta: float) -> void:
	var mouse_position = get_viewport().get_mouse_position()
	position = mouse_position

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if shove_area.overlaps_body(ball):
			var force = position.direction_to(ball.position) * shove_strength
			ball.apply_central_impulse(force)
