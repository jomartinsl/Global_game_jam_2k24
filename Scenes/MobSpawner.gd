extends Node2D

var enemy_scene = preload("res://Scenes/zombie.tscn")
var count = 0

func _physics_process(delta):
	$Timer.start()

func _on_Timer_timeout():
	if (count >= 15):
		var enemy = enemy_scene.instance()
		add_child(enemy)
		count += 1
