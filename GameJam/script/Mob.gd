extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var buffer

var oldposDep
var delta
var oldAction


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("add_event", get_tree().get_root().get_child(0), "addEvent", [buffer])
	cleanBuffer()
	
func addBuffer(posDep, action, posArr):
	
	#1st frame of a second
	if delta == 0:
		oldAction = action
		oldposDep = posDep
		
	if oldAction == action:
		pass
	else:
		var dict = {"posDep": oldposDep, "action":oldAction, "delta":delta}
		buffer.append(dict)
		
		oldposDep = posDep
		oldAction = action
		
		
	
func getBuffer():
	return buffer
	
func cleanBuffer():
	buffer = []
	delta = 0
	
func _on_next_second(newSec):
	var recap = getBuffer()
	cleanBuffer()
	emit_signal("add_event", recap)
	print("récap envoyé")
