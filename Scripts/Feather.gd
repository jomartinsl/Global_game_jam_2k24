extends StaticBody2D

const SPEED = 300
var velocity_percent = Vector2.ZERO
var direction = Vector2(0, 0)

#States
var attacking = false
var time = 0

func _ready():
	get_node("Hitbox").disabled = true

func _process(delta):
	look_at(get_global_mouse_position())
	_animate(delta)

func _animate(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and !attacking:
		get_node("Animation").play("Feather")
		get_node("Hitbox").disabled = false
		$TickleSound.play()
		attacking = true
		time = 0
	elif time >= .45:
		get_node("Animation").stop()
		get_node("Hitbox").disabled = true
		if !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			attacking = false
	elif attacking:
		time += delta
	look_at(get_global_mouse_position())
