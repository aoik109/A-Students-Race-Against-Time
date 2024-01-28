extends Area2D

signal player_hit_assignment

# Called when the node enters the scene tree for the first time.
func _ready():
	## Get the animation names and play a random animation (choose a random one)
	var sheet_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(sheet_types[randi() % sheet_types.size()])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()