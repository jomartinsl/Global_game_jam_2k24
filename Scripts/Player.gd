extends CharacterBody2D

const SPEED = 500
var velocity_percent = Vector2.ZERO
var direction = Vector2(0, 0)

func _physics_process(delta):
	_animate()
	_move_player()
	look_at(get_global_mouse_position())

func _animate():
	var animation = get_node("Animation")
	if direction != Vector2.ZERO:
		animation.play("Walk")
	else:
		animation.stop()

func _move_player():
	if Input.is_action_pressed("ui_down"):
		direction.y = 1
	elif Input.is_action_pressed("ui_up"):
		direction.y = -1
	else:
		direction.y = 0
	
	if Input.is_action_pressed("ui_left"):
		direction.x = -1
	elif Input.is_action_pressed("ui_right"):
		direction.x = 1
	else:
		direction.x = 0
		
	velocity_percent = velocity_percent.move_toward(direction, SPEED)
	velocity = SPEED * velocity_percent
	move_and_slide()
