extends CharacterBody2D  # Eller Sprite

var player

var speed = 100


func _ready():
	player = $"../Player"

func _animate():
	var animation = get_node("Animation")
	
	animation.play("Walk")
	

func _process(delta):
	_animate()
	var direction = (player.position - position).normalized()
	position += direction * speed * delta
	look_at(player.position)
