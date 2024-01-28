extends HBoxContainer

@onready var hjerteClass = preload("res://Scenes/hjerte.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func maxHjerter(max):
	for i in range(max):
		var hjerte = hjerteClass.instantiate()
		add_child(hjerte)
		
func updateHjerter(currentHealth: int):
	var hjerter = get_children()
	for i in range(currentHealth):
		hjerter[i].oppdater(true)
	for i in range(currentHealth,hjerter.size()):
		hjerter[i].oppdater(false)
