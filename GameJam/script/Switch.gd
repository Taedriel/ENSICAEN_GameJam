extends StaticBody2D

var is_activate = false
export (bool) var left = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.flip_h = !left
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if body.name == "RockBullet":
		is_activate = !is_activate
		$Sprite.flip_h = !$Sprite.flip_h
		$AudioStreamPlayer2D.play()

