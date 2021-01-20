extends RigidBody2D
var cpt = 0
export (int) var timer = 20
var bodies

func _ready():
	self.contact_monitor = true

func _process(_delta):
	cpt += 1
	if fmod(cpt, timer) == 0:
		self.queue_free()

