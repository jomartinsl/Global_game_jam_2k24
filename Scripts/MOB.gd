extends CharacterBody2D  # Eller Sprite

var player

var SPEED = 300


func _ready():
	player = $"../Player"

func _animate():
	var animation = get_node("Animation")
	
	animation.play("Walk")
	

func _process(delta):
	velocity = Vector2.ZERO
	
	_animate()
	var direction = (player.position - position).normalized()
	
	position += SPEED * direction * delta
	
	look_at(player.position)
	move_and_slide()


