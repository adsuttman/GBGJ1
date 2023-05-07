extends Control


func _on_free_play_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")


func _on_timer_mode_pressed() -> void:
	get_tree().change_scene_to_file("res://timer_mode.tscn")


func _on_score_mode_pressed() -> void:
	get_tree().change_scene_to_file("res://score_mode.tscn")


func _on_frenzy_mode_pressed() -> void:
	get_tree().change_scene_to_file("res://score_frenzy_mode.tscn")
