extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var i = get_child(1)
	for p in i.get_children():
		for g in p.get_children():
			g.connect("pressed", self, "_on_Button_pressed", [g.num])
	

func _on_Button_pressed(numero):
	get_tree().change_scene("res://godot_component/scene/Level"+numero+".tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
