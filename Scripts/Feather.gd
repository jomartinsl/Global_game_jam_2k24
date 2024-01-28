extends StaticBody2D

const SPEED = 300
var velocity_percent = Vector2.ZERO
var direction = Vector2(0, 0)

var animation_played = false

func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and !animation_played:
		get_node("Animation").play("Feather")
		animation_played = true
	elif Input.is_action_just_released("ui_accept"):
		animation_played = false
		get_node("Animation").stop()

	# Look at the mouse position regardless of button press
	look_at(get_global_mouse_position())
