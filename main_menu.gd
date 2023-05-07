extends Control


func _on_free_play_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")
