extends StaticBody2D

var is_activate = false
export (bool) var left = true
var inZone = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.flip_h = !left


func _input(event):
	
	if event.is_action_pressed('ui_select') and inZone:
		is_activate = !is_activate
		$Sprite.flip_h = !$Sprite.flip_h
		$AudioStreamPlayer2D.play()


func _on_Area2D_body_entered(body):
	inZone = true

func _on_Area2D_body_exited(body):
	inZone = false
