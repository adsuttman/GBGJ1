extends Node2D

@export var max_speed_points: int = 100

@onready var ball = $Ball

var speed_points: int = 0
var started = false

signal ball_touched_floor
signal game_started

func _physics_process(delta: float) -> void:
	if ball.position.y > 712:
		ball_touched_floor.emit()
		ball.floor_hit()
 
func set_speed_points(val: int):
	speed_points = clampi(val,0,max_speed_points)
	$Pointer/ProgressBar.value = speed_points

func display_game_over(score: String):
	$GameOver/GameOverText/Score.text = "Your score was: " + score
	$Pointer.hide()
	$GameOver.show()
	await get_tree().create_timer(2).timeout
	disable_ball()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_ball_unfrozen() -> void:
	if !started:
		game_started.emit()
		started = true
		$Tutorial.hide()


func _on_retry_pressed() -> void:
	get_tree().reload_current_scene()


func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_ball_speeding(val: int) -> void:
	set_speed_points(speed_points + val)

func disable_ball():
	ball.disable()
