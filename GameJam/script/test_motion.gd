extends RigidBody2D

func _process(delta):
	manage_inputs()

func manage_inputs():
	var moving = false
	if Input.is_action_just_pressed("ui_up"):
		if linear_velocity.y == 0:
			jump()
	if Input.is_action_pressed("ui_right"):
		move("right")
		moving = true
	if Input.is_action_pressed("ui_left"):
		move("left")
		moving = true
	if !moving:
		vel_linear.x = 0

func jump():
	apply_central_impulse(Vector2(0, -1000))

func move(direction):
	if direction == "right":
		vel_linear.x = 400
	if direction == "left":
		vel_linear.x = -400

func _integrate_forces(state):
	state.linear_velocity.x = vel_linear.x
