extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal add_event(recap, obj)

var buffer = []
var dict
var sens


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("add_event", get_tree().get_root().get_child(0), "addEvent")
	
func sendAction(pos, action):
	buffer = {"pos": pos, "action":action}
	emit_signal("add_event", buffer, self)

func _on_time_sens_changing(newsens):
	sens = newsens
		
func _on_next_second(newSec):
	pass
