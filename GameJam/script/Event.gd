extends Node


var hasBeenDone = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func event():
	pass

func _on_trigger(val):
	if val and !hasBeenDone:
		event()
	hasBeenDone = true
	
