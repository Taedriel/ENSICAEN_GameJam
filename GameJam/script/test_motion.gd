extends KinematicBody2D

export (int) var speed = 600
export (bool) var key_pressed = false
export (float) var GRAVITY = 20.0
const UP = Vector2(0, -1)

var A_pressed = false
var left =  false

export (int) var bullet_x = 30
export (int) var bullet_y = 15

export (int) var bullet_up_dir = 90

var bullet_speed = 1000
var bullet = preload("res://godot_component/dynamic_obj/RockBullet.tscn")
var velocity = Vector2()

func get_input(delta):
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
		$AnimatedSprite.play("run")
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		key_pressed = true
		left = true
		velocity.x -= 1
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("run")
	if Input.is_key_pressed(KEY_A) and not A_pressed:
		key_pressed = true
		A_pressed = true
		$AnimatedSprite.play("attack")
		yield(get_tree().create_timer(0.5), "timeout")
		fire()
	elif Input.is_key_pressed(KEY_A) and A_pressed:
		key_pressed = true
	else:
		A_pressed = false
	if key_pressed == false:
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

func kill():
	get_tree().reload_current_scene()


func _physics_process(delta):
	get_input(delta)
	velocity = move_and_slide(velocity, UP)
