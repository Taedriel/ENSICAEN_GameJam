extends KinematicBody2D

var speed = 200
export (bool) var fallen = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if fallen:
		move_and_collide(speed * delta * Vector2(0, 1), false)
