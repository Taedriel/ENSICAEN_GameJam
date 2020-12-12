extends KinematicBody2D

export (int) var speed = 600
var key_pressed = false
export (float) var GRAVITY = 20.0
const UP = Vector2(0, -1)

var bullet_speed = 700
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
		key_pressed = true
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("run")
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		key_pressed = true
		velocity.x -= 1
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("run")
	if Input.is_key_pressed(KEY_A):
		$AnimatedSprite.play("attack")
		fire()
	if key_pressed == false:
		$AnimatedSprite.play('idle')
	velocity = velocity * speed

func fire():
	var bullet_instance = bullet.instance()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child",bullet_instance)

func kill():
	get_tree().reload_current_scene()


func _physics_process(delta):
	get_input(delta)
	velocity = move_and_slide(velocity, UP)