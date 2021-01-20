extends "Mob.gd"

var speed = 200
export (bool) var fallen = false
var hasBeenDone = false

func _ready():
	._ready()
	add_to_group("box")

func _physics_process(delta):
	if Csens:
		if fallen:
			sendAction(position, "down")
			# La variable c'est juste pour enlever un warning
			var _warn = move_and_collide(speed * delta * Vector2(0, 1), false)

func lock():
	fallen = false
	
func unlock():
	fallen = true
