extends Node2D  # Eller Sprite

var player

var speed = 100


func _ready():
	player = $"../Player"

func _process(delta):
	var direction = (player.position - position).normalized()
	position += direction * speed * delta
	look_at(player.position)
