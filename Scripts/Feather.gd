extends StaticBody2D

const SPEED = 300
var velocity_percent = Vector2.ZERO
var direction = Vector2(0, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	_animate()

	
func _animate():
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		get_node("Animation").play("Feather")
	else:
		get_node("Animation").stop()
