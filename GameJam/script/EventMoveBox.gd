extends "Event.gd"

var box

func _ready():
	box = get_child(0)
	box.lock()

func event():
	box.unlock()
