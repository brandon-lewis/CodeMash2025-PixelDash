extends Control

const level : PackedScene = preload("res://Scenes/Level/level_1.tscn")

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(level)


func _on_quit_button_pressed() -> void:
	get_tree().quit()


signal level_selected(level_num)

func _on_level_1_button_pressed() -> void:
	level_selected.emit(1)


func _on_level_2_button_pressed() -> void:
	level_selected.emit(2)
