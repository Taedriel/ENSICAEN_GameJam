extends StaticBody2D

export (bool) var is_left = true


# Called when the node enters the scene tree for the first time.
func _ready():
	if !is_left:
		$Sprite.flip_h = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
