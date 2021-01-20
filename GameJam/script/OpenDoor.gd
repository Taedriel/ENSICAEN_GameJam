extends Node2D

var cible
var dest = null
var inZone = null

# Called when the node enters the scene tree for the first time.
func _ready():
	# La variable c'est juste pour enlever un warning
	var _warn = $Area2D.connect("body_entered", self, "_on_Area2D_body_entered")
	_warn = $Area2D.connect("body_exited", self, "_on_Area2D_body_exited")
	
	for child in get_parent().get_children():
		if child == self:
			continue
		else:
			dest = child.get_global_position()
			
	inZone = 0
	cible = get_tree().get_nodes_in_group("player")[0]

func _input(event):
	if event.is_action_pressed('ui_select') and inZone and cible != null:
		cible.position.x = dest.x
		cible.position.y = dest.y


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		inZone = true
	

func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):
		inZone = false
