
extends "fade_out.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Switch.is_activate:
		$Boxe.fallen = true
		
	if $Switch1.is_activate:
		fade_out("change_scene", "res://godot_component/scene/Menu.tscn")
	pass
