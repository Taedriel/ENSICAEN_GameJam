extends KinematicBody2D

var cpt = 0
export (bool) var run_left = true
var motion = Vector2(10, 0)
const UP = Vector2(0, -1)
var speed = 600
var anim = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.flip_h = !run_left


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimatedSprite.play("default")
	cpt += delta
	if cpt < 1:
		move_and_slide((-1 if run_left else 1) * delta * speed * motion, UP)
	elif anim == false:
		$AnimatedSprite.flip_h = run_left
		yield(get_tree().create_timer(1), "timeout")
		$AnimatedSprite.flip_h = !run_left
		yield(get_tree().create_timer(0.5), "timeout")
		anim = true
	else:
		move_and_slide((-1 if run_left else 1) * delta * speed * motion, UP)
	if cpt > 10:
		self.queue_free()
