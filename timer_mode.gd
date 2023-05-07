extends Node2D

var time: int = 0
@onready var timer = $Timer
@onready var UI = $UI
@onready var label = $UI/Time
@onready var game = $Game

func start_timer():
	label.show()
	timer.start()

func _on_timer_timeout() -> void:
	time += 1
	label.text = "\n" + String.num(time) + " seconds"


func _on_game_ball_touched_floor() -> void:
	timer.stop()
	UI.hide()
	game.display_game_over(String.num(time) + " seconds")


func _on_game_game_started() -> void:
	start_timer()
