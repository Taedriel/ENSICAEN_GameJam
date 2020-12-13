extends "Mob.gd"

var speed = 200
export (bool) var fallen = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if fallen:
		sendAction(position, "down")
		move_and_collide(speed * delta * Vector2(0, 1), false)

func lock():
	fallen = false
	
func unlock():
	fallen = true
