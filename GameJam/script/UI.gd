extends Control
	
var menu = preload("res://godot_component/scene/GameMenu.tscn")
	
func get_input():
	#Pas utilisée pour le moment 
	#var menu_instance = menu.instance()
	if Input.is_action_just_pressed("ui_home"):
		# La variable c'est juste pour enlever un warning
		var _warn = get_tree().change_scene("res://godot_component/scene/Menu.tscn")
	
func _process(_delta):
	get_input()
	

	
func _on_next_second(newSec):
	print(newSec)
	get_tree().get_nodes_in_group("chrono")[0].text = str(newSec)
