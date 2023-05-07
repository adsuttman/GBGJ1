extends Node2D
@onready var shove_area: Area2D = $ShoveArea
@onready var indicator: Sprite2D = $ShoveIndicator

@export var ball: RigidBody2D
@export var shove_strength: float = 500
@export var positive_color: Color
@export var negative_color: Color

func _ready() -> void:
	indicator.self_modulate = negative_color

func _physics_process(delta: float) -> void:
	var mouse_position = get_viewport().get_mouse_position()
	position = mouse_position

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if shove_area.overlaps_body(ball):
			var force = position.direction_to(ball.position) * shove_strength
			ball.apply_central_impulse(force)


func _on_shove_area_body_entered(body: Node2D) -> void:
	if body == ball:
		indicator.self_modulate = positive_color


func _on_shove_area_body_exited(body: Node2D) -> void:
	if body == ball:
		indicator.self_modulate = negative_color
