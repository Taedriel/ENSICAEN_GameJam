extends "Event.gd"

var boite

func _ready():
	boite = preload("res://godot_component/dynamic_obj/Boxe.tscn")

func event():
	var inst = boite.instance()
	print(self.position)
	inst.position = self.position
	inst.unlock()
	get_tree().get_root().get_child(0).add_child(inst)	
