extends "Mob.gd"

var speed = 200
export (bool) var fallen = false
var hasBeenDone = false

func _ready():
	._ready()

func _physics_process(delta):
	if sens:
		if fallen:
			sendAction(position, "down")
			move_and_collide(speed * delta * Vector2(0, 1), false)

func lock():
	sendAction(position, "lock")
	fallen = false
	
func unlock():
	sendAction(position, "unlock")
	fallen = true
