extends KinematicBody2D

export (int) var speed = 600
var key_pressed = false
export (float) var GRAVITY = 20.0
const UP = Vector2(0, -1)

var left =  false

export (bool) var is_inv = false

export (int) var bullet_x = 30
export (int) var bullet_y = 15

export (int) var bullet_up_dir = 90

var hit_delay = 1

var bullet_speed = 1000
var bullet = preload("res://godot_component/dynamic_obj/RockBullet.tscn")
var velocity = Vector2()

var cpt_att = 3

func get_input(delta):
	cpt_att += delta
	velocity = Vector2()
	key_pressed = false
	if is_on_floor():
		GRAVITY = 20
	else:
		GRAVITY = 100 
	velocity.y += delta * GRAVITY
	if Input.is_action_pressed('ui_right'):
		left = false
		key_pressed = true
		$AnimatedSprite.flip_h = false
		if is_inv:
			$AnimatedSprite.play("inv_run")
		else:
			$AnimatedSprite.play("run")
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		key_pressed = true
		left = true
		velocity.x -= 1
		$AnimatedSprite.flip_h = true
		if is_inv:
			$AnimatedSprite.play("inv_run")
		else:
			$AnimatedSprite.play("run")
	if Input.is_key_pressed(KEY_A) and cpt_att > hit_delay:
		cpt_att = 0
		key_pressed = true
		if is_inv:
			$AnimatedSprite.play("inv_attack")
		else:
			$AnimatedSprite.play("attack")
		yield(get_tree().create_timer(0.5), "timeout")
		fire()
	else:
		if cpt_att < hit_delay:
			key_pressed = true
			if is_inv:
				$AnimatedSprite.play("inv_attack")
			else:
				$AnimatedSprite.play("attack")
				
				
	if key_pressed == false:
		if is_inv:
			$AnimatedSprite.play('inv_idle')
		else:
			$AnimatedSprite.play('idle')
	velocity = velocity * speed

func fire():
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
	get_input(delta)
	velocity = move_and_slide(velocity, UP)
