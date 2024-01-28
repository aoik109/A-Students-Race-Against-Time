extends Area2D

@export var player_speed = 10
const BACKGROUND_WIDTH = 1920

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_up"):
		position.y -= player_speed
	if Input.is_action_pressed("move_down"):
		position.y += player_speed
