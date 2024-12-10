extends Node

var current_level_instance : Level
var current_level_num : int

func _on_main_menu_level_selected(level_num: Variant) -> void:
	var next_level_scene = load("res://Scenes/Level/level_%d.tscn" % level_num)
	current_level_instance = next_level_scene.instantiate()
	current_level_num = level_num
	current_level_instance.connect('level_done', finish_level)
	add_child(current_level_instance)
	$MainMenu.visible = false


func finish_level(player_won:bool) -> void:
	remove_child(current_level_instance)
	$MainMenu.visible = true
