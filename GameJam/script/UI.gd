extends Control
	
var menu = preload("res://godot_component/scene/GameMenu.tscn")
	
func get_input():
	var menu_instance = menu.instance()
	if Input.is_action_just_pressed("ui_home"):
		get_tree().change_scene("res://godot_component/scene/Menu.tscn")
	
func _process(delta):
	get_input()
	

	
func _on_next_second(newSec):
	print(newSec)
	get_tree().get_nodes_in_group("chrono")[0].text = str(newSec)
