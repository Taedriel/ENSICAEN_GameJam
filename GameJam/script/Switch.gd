extends StaticBody2D

var is_activate = false
export (bool) var left = true
export (bool) var finish = false
var in_zone = false
var fmontant

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.connect("body_entered", self, "_on_Area2D_body_entered")
	$Area2D.connect("body_exited", self, "_on_Area2D_body_exited")
	
	$Sprite.flip_h = !left
	in_zone = false
	$AudioStreamPlayer2D.stream.loop = false


func _input(event):
	if event.is_action_pressed('ui_select') and in_zone:
		is_activate = !is_activate
		fmontant = true
		$Sprite.flip_h = !$Sprite.flip_h
		if is_activate and fmontant: 
			$AudioStreamPlayer2D.play()
			fmontant = false
			
		if finish:
			get_tree().change_scene("res://godot_component/scene/Selector.tscn")
		
			
func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		in_zone = true

func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):
		in_zone = false
