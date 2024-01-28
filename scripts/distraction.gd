extends Area2D

signal player_hit_distraction

var item_type = "distraction"

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group(item_type)
	## Get the animation names and play a random animation (choose a random one)
	var distraction_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(distraction_types[randi() % distraction_types.size()])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= 5


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
