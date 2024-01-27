extends CharacterBody2D


var player

var speed =130

func _ready():
	player = $"../Player"
	var hitbox = get_node("Hitbox")
	
func _animate():
	var animasjon = get_node("AnimatedSprite2D")
	animasjon.play("Walk1")


func _process(delta):
	_animate()
	var direction = (player.position -position).normalized()
	position+= direction* speed * delta
	look_at(player.position)
