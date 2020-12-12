extends KinematicBody2D

export (float) var GRAVITY = 20.0
var velocity = Vector2()
export (int) var speed = 600
const UP = Vector2(0, -1)

var cpt = 0

export (int) var max_hp = 30
var hp = max_hp


func get_input(delta):
	velocity = Vector2()
	if is_on_floor():
		GRAVITY = 20
	else:
		GRAVITY = 100 
	velocity.y += delta * GRAVITY
	velocity = velocity * speed
	$AnimatedSprite.play("run")


func _process(delta):
	if hp <= 0:
		self.queue_free()

func hit():
	print(hp)
	hp -= 10

func _physics_process(delta):
	cpt += delta
	get_input(delta)
	velocity = move_and_slide(velocity, UP, false, 4, PI/4, false)
	for index in get_slide_count():
		var value = get_slide_collision(index)
		if value.collider.is_in_group("bullet") and cpt > 1:
			cpt = 0
			hit()
	
