extends "Mob.gd"

export (float) var GRAVITY = 20.0
var velocity = Vector2()
export (int) var speed = 600
const UP = Vector2(0, -1)
var tmp_vec = Vector2()

var hip_size = 1.6
var hip_range = 1

var cpt = 0
var cpt_jp = 0

export (int) var max_hp = 30
var hp = max_hp

var cible = null
var inZone = false

var action = randi()%2
var on_air = false

func move_right():
	$AnimatedSprite.flip_h = true
	$AnimatedSprite.play("run")

func move_left():
	$AnimatedSprite.flip_h = false
	$AnimatedSprite.play("run")
	
func idle():
	$AnimatedSprite.play("run")

func get_input(delta):
	velocity = Vector2()
	if is_on_floor():
		on_air = !on_air
		GRAVITY = 20
	else:
		GRAVITY = 100

	velocity.y += delta * GRAVITY
	
	if action == 1 and cpt_jp < 2:
		sendAction(position, "left")
		move_left()
		cpt_jp += delta
		velocity.x += hip_range * delta
#		if on_air and cpt_jp < 0.5 :
#			velocity.y -= hip_size 
	elif action == 0 and cpt_jp < 2:
		sendAction(position, "right")
		move_right()
		cpt_jp += delta
		velocity.x += -hip_range * delta
#		if on_air and cpt_jp < 0.5 :
#			velocity.y -= hip_size 
	else:
		sendAction(position, "idle")
		idle()
		cpt_jp = 0
		action = randi()%3
	velocity = velocity * speed


func _process(_delta):
	if hp <= 0:
		self.queue_free()

func hit():
	hp -= 10

func _physics_process(delta):
	if Csens:
		get_input(delta)
		
	cpt += delta
	
	velocity = move_and_slide(velocity, UP, false, 4, PI/4, false)
	for index in get_slide_count():
		var value = get_slide_collision(index)
		if value.collider.is_in_group("bullet") and cpt > 1:
			if position.x - value.position.x > 0:
				$AnimatedSprite.flip_h = true
			else:
				$AnimatedSprite.flip_h = false
			cpt = 0
			hit()
			



	
