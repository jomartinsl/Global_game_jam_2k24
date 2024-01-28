extends CharacterBody2D

@onready var zombie = $"../zombie"

const SPEED = 500
var velocity_percent = Vector2.ZERO
var direction = Vector2(0, 0)
var maxHealth = 5
var Health = maxHealth
var hit = false
var time = 0

func _physics_process(delta):
	time += delta
	_animate()
	_move_player()
	look_at(get_global_mouse_position())
	enemyCollision()
	

func _animate():
	var animation = get_node("Animation")
	if direction != Vector2.ZERO:
		animation.play("Walk")
	else:
		animation.stop()

func _move_player():
	if Input.is_action_pressed("ui_down") or Input.is_key_pressed(KEY_S):
		direction.y = 1
	elif Input.is_action_pressed("ui_up") or Input.is_key_pressed(KEY_W):
		direction.y = -1
	else:
		direction.y = 0
	
	if Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A):
		direction.x = -1
	elif Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D):
		direction.x = 1
	else:
		direction.x = 0
		
	velocity_percent = velocity_percent.move_toward(direction, SPEED)
	velocity = SPEED * velocity_percent
	move_and_slide()

func enemyCollision():
	for i in get_slide_collision_count():
		var colisjon = get_slide_collision(i)
		var collider = colisjon.get_collider()
		if collider.name == zombie.name:
			if time > 1:
				Health -= 1
				hit = true
				time = 0
	
