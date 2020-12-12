extends Node

signal reverse_time(val)

var cible = null
var inZone = false

func _ready():
	connect("reverse_time", get_tree().get_root().get_child(0), "reverseTime")

func _input(event):
	if event.is_action_pressed('ui_select') and inZone and cible != null:
		cible.is_inv = !cible.is_inv
		emit_signal("reverse_time", cible.is_inv)

func _on_Area2D_body_entered(body):
	cible = body
	inZone = true
	
func _on_Area2D_body_exited(body):
	inZone = false
	cible = null
