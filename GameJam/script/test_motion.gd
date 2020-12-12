extends "Mob.gd"

export (int) var speed = 500
export (float) var GRAVITY = 20.0
const UP = Vector2(0, -1)

var is_inv = false
var left =  false

var bullet_x = 30
var bullet_y = 15
var bullet_up_dir = 90

var hit_delay = 1
var bullet_speed = 1000
var velocity = Vector2()
var bullet = preload("res://godot_component/dynamic_obj/RockBullet.tscn")

var cpt_att = 3

func move_right():
	$AnimatedSprite.flip_h = false
	if is_inv:
		$AnimatedSprite.play("inv_run")
	else:
		$AnimatedSprite.play("run")


func move_left():
	$AnimatedSprite.flip_h = true
	if is_inv:
		$AnimatedSprite.play("inv_run")
	else:
		$AnimatedSprite.play("run")

func swap():
	is_inv = !is_inv

func get_input(delta):
	cpt_att += delta
	velocity = Vector2()

	if is_on_floor():
		GRAVITY = 20
	else:
		GRAVITY = 100 
	velocity.y += delta * GRAVITY
	if Input.is_action_pressed('ui_right'):
		sendAction(position, "right")
		move_right()
		left = false
		velocity.x += 1
	elif Input.is_action_pressed('ui_left'):
		sendAction(position, "left")
		move_left()
		left = true
		velocity.x -= 1
		
	elif Input.is_key_pressed(KEY_A) and cpt_att > hit_delay and velocity.x == 0:
		sendAction(position, "fire")	
		cpt_att = 0

		if is_inv:
			$AnimatedSprite.play("inv_attack")
		else:
			$AnimatedSprite.play("attack")
		yield(get_tree().create_timer(0.5), "timeout")
		fire(delta)
	elif cpt_att < hit_delay:

		if is_inv:
			$AnimatedSprite.play("inv_attack")
		else:
			$AnimatedSprite.play("attack")
				
				
	else:
		sendAction(position, "idle")

		if is_inv:
			$AnimatedSprite.play('inv_idle')
		else:
			$AnimatedSprite.play('idle')
	velocity = velocity * speed

func fire(delta):
	var bullet_instance = bullet.instance()
	if !left:
		bullet_instance.position = get_global_position()
		bullet_instance.position.x += bullet_x
		bullet_instance.position.y += bullet_y
		bullet_instance.rotation_degrees = 0
		bullet_instance.apply_central_impulse(Vector2(bullet_speed,-bullet_up_dir))
	else:
		bullet_instance.position = get_global_position()
		bullet_instance.position.x -= bullet_x
		bullet_instance.position.y += bullet_y
		bullet_instance.rotation_degrees = 0
		bullet_instance.apply_central_impulse(Vector2(-bullet_speed,bullet_up_dir))
	get_tree().get_root().call_deferred("add_child",bullet_instance)


func _physics_process(delta):
	if !sens:
		get_input(delta)
	
	velocity = move_and_slide(velocity, UP)
