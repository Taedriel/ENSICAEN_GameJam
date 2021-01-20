extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_NewGameButton_pressed():
	# La variable c'est juste pour enlever un warning
	var _warn = get_tree().change_scene("res://godot_component/scene/Level1.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_ContinueButton_pressed():
	# La variable c'est juste pour enlever un warning
	var _warn = get_tree().change_scene("res://godot_component/scene/Selector.tscn")


func _on_OptionButton_pressed():
	# La variable c'est juste pour enlever un warning
	var _warn = get_tree().change_scene("res://godot_component/scene/OptionMenu.tscn")
