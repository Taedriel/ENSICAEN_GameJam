extends RigidBody2D

var cpt = 0
export (int) var timer = 20

func _process(delta):
	cpt += 1
	if fmod(cpt, timer) == 0:
		self.queue_free()
