extends Node2D

@onready var game = $Game
@onready var label = $UI/Score
@onready var UI = $UI

@export_category("Collectible Settings")
@export var collectible: PackedScene
@export_range(0, 1280) var min_spawn_x: int
@export_range(0, 1280) var max_spawn_x: int
@export_range(0, 720) var min_spawn_y: int
@export_range(0, 720) var max_spawn_y: int


var score: int = 0
var random: RandomNumberGenerator = RandomNumberGenerator.new()

func _ready() -> void:
	random.randomize()

func spawn_collectible():
	var inst: Collectible = collectible.instantiate()
	inst.position.x = random.randi_range(min_spawn_x,max_spawn_x)
	inst.position.y = random.randi_range(min_spawn_y,max_spawn_y)
	inst.ball_entered.connect(on_collection)
	add_child(inst)
	
func on_collection():
	score += 1
	update_label()
	spawn_collectible()

func update_label():
	label.text = String.num(score) + " points"

func _on_game_ball_touched_floor() -> void:
	UI.hide()
	game.display_game_over(String.num(score) + " points")


func _on_game_game_started() -> void:
	spawn_collectible()
	label.show()
