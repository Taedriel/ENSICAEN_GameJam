extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# La variable c'est juste pour enlever un warning
	var _warn = connect("pressed", self, "_on_Button_pressed", [])

func _on_Button_pressed():
	# La variable c'est juste pour enlever un warning
	var _warn = get_tree().change_scene("res://godot_component/scene/Menu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
