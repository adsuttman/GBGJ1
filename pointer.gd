extends Node2D
@onready var shove_area: Area2D = $ShoveArea
@onready var indicator: Sprite2D = $ShoveIndicator
@onready var game = $".."

@export var ball: RigidBody2D
@export var shove_strength: float = 500
@export var positive_color: Color
@export var negative_color: Color

var shove_delay: int = 0

func _ready() -> void:
	indicator.self_modulate = negative_color

func _physics_process(delta: float) -> void:
	var mouse_position = get_viewport().get_mouse_position()
	position = mouse_position
	shove_delay = clampi(shove_delay - 1,0,15)
#	if shove_delay != 0:
#		print(shove_delay)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and shove_delay == 0:
			if shove_area.overlaps_body(ball):
				ball.unfreeze()
				var force = position.direction_to(ball.position) * shove_strength
				ball.apply_central_impulse(force)
#				print("shoved")
				shove_delay  = 15
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if shove_area.overlaps_body(ball) and game.speed_points == 100:
				ball.stop()
				game.set_speed_points(0)


func _on_shove_area_body_entered(body: Node2D) -> void:
	if body == ball:
		indicator.self_modulate = positive_color


func _on_shove_area_body_exited(body: Node2D) -> void:
	if body == ball:
		indicator.self_modulate = negative_color
