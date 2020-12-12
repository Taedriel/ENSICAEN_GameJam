extends KinematicBody2D

var velocity = Vector2(1, 0)
var speed = 200


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _physics_process(delta):
	velocity.x += speed
	move_and_collide(velocity)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
