extends "res://script/OpenDoor.gd"

signal reverse_time(val)

func _input(event):
	if event.is_action_pressed('ui_select') and inZone and cible != null:
		cible.is_inv = !cible.is_inv
		emit_signal("reverse_time", true)
