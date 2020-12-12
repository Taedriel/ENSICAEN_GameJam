extends Node2D

var cible = null
var inZone = false setget door
var dest = null
var cpt = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#on cherche dans les enfants
	for child in get_children():
		if child.has_method("door"):
			dest = child.get_global_position()
			return
			
	#on cherche dans les parents
	dest = get_parent().get_global_position()
	return

func door(_door):
	return inZone


func _input(event):
	if event.is_action_pressed('ui_select') and inZone and cible != null:
		cible.position.x = dest.x
		cible.position.y = dest.y


func _on_Area2D_body_entered(body):
	cible = get_tree().get_root()
	inZone = true
	

func _on_Area2D_body_exited(body):
	inZone = false
	cible = null
