extends Node

signal reverse_time(val)

var cible = null
var inZone = false

func _ready():
	connect("reverse_time", get_tree().get_root().get_child(0), "reverseTime")

func _input(event):
	if event.is_action_pressed('ui_select') and inZone and cible != null:
		cible.swap()
		cible.sendAction(cible.position, "swap")
		emit_signal("reverse_time", cible.is_inv)

func _on_Area2D_body_entered(_body):
	cible = get_tree().get_nodes_in_group("player")[0]
	inZone = true
	
func _on_Area2D_body_exited(_body):
	inZone = false
	cible = null
