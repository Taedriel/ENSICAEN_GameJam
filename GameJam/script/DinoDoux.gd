extends RigidBody2D

var left = true
var speed = 20

func _process(delta):
	
	if Input.is_action_pressed("ui_right"):
		if left == false:
			$AnimatedSprite.flip_h = false
		left = true
		$AnimatedSprite.play("run")
		position.x += 20
	elif Input.is_action_pressed("ui_left"):
		if left == true:
			$AnimatedSprite.flip_h = true
		left = false
		$AnimatedSprite.play("run")
		position.x -= speed
	elif Input.is_key_pressed(KEY_A):
		$AnimatedSprite.play("under_attack")
	else:
		$AnimatedSprite.play("idle")
