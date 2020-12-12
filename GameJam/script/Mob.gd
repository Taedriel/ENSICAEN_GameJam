extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal add_event(recap, obj)

var buffer = []
var dict
var sens

var oldposDep
var total_delta
var oldAction


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("add_event", get_tree().get_root().get_child(0), "addEvent")
	cleanBuffer()
	
func addBuffer(posDep, action, d):
	#1st frame of a second
	dict = {"posDep": oldposDep, "action":oldAction, "delta":total_delta}
	
	if total_delta == 0:
		oldAction = action
		oldposDep = posDep
	
	if oldAction == action:
		total_delta += d
	else:
		buffer.append(dict)
		
		oldposDep = posDep
		oldAction = action
		total_delta = 0
		
func getBuffer():
	return buffer
	
	
func cleanBuffer():
	print(dict)
	if len(buffer) == 0:
		buffer.append(dict)
		
	buffer = []
	total_delta = 0
	
func _on_time_sens_changing(newsens):
	sens = newsens
	
func _on_next_second(newSec):
	var toSend = getBuffer()
	emit_signal("add_event", buffer, self)
	cleanBuffer()
