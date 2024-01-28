extends Area2D

signal player_hit_soap

var item_type = "soap"

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group(item_type)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= 5


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
