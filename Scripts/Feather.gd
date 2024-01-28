extends StaticBody2D

const SPEED = 300
var velocity_percent = Vector2.ZERO
var direction = Vector2(0, 0)


func _ready():
	get_node("Hitbox").disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	_animate()
	#get_node("Hitbox").disabled = false

	
func _animate():
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		get_node("Animation").play("Feather")
		get_node("Hitbox").disabled = false
	else:
		get_node("Animation").stop()
		get_node("Hitbox").disabled = true

	# Look at the mouse position regardless of button press
	look_at(get_global_mouse_position())
