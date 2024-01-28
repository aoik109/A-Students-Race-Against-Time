extends Area2D

signal hit_progress
signal hit_distraction
signal hit_chore

@export var player_speed = 10
@export var player_x_coord = 196

const BACKGROUND_WIDTH = 1920

var height_low_bound = 200 # (720-256)-256
var height_high_bound = 464

var action_type

# Called when the node enters the scene tree for the first time.
func _ready():
	action_type = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(action_type[1])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_up"):
		position.y -= player_speed
	if Input.is_action_pressed("move_down"):
		position.y += player_speed
	position = position.clamp(Vector2(player_x_coord, height_low_bound), Vector2(player_x_coord, height_high_bound))


# Reset the player
func start(pos):
	position = pos ## pos == Startposition (will be called in main) TODO
	$AnimatedSprite2D.play(action_type[1])
