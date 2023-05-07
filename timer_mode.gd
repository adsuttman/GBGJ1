extends Node2D

var time: int = 0
@onready var timer = $Timer
@onready var label = $UI/Time

func _ready() -> void:
	start_timer()

func start_timer():
	timer.start()

func _on_timer_timeout() -> void:
	time += 1
	label.text = "\n" + String.num(time) + " seconds"
