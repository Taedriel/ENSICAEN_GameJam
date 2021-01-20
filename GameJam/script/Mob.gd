extends KinematicBody2D

signal add_event(recap, obj)
signal add_ressources(name, ref)

var buffer = []
var dict
var Csens = true
var ref

func move_left():
	pass
	
func move_right():
	pass
	
func move_down():
	pass
	
func move_up():
	pass
	
func idle():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	# La variable c'est juste pour enlever un warning
	var _warn = connect("add_event", get_tree().get_root().get_child(0), "addEvent")
	_warn = connect("add_ressources", get_tree().get_root().get_child(0), "addRessources")
	
func sendAction(pos, action):
	if Csens:
		buffer = {"pos": pos, "action":action}
		emit_signal("add_event", buffer, self)

func _on_time_change(_newsens):
	Csens = !Csens
		
func _on_next_second(_newSec):
	pass
