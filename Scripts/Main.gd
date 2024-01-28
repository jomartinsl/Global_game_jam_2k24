extends Node2D

@onready var hjerteContainer = $CanvasLayer/HjerteContainer
@onready var player = $Player
@onready var canvas_layer_2 = $CanvasLayer2


# Called when the node enters the scene tree for the first time.
func _ready():
	hjerteContainer.maxHjerter(player.maxHealth)
	hjerteContainer.updateHjerter(player.maxHealth)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player.hit:
		hjerteContainer.updateHjerter((player.Health))
		player.hit = false
	if player.Health <= 0:
		canvas_layer_2.visible = true
		player.Health = 0
