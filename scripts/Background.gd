extends Sprite2D

@export var scroll_speed = 2
const BACKGROUND_WIDTH = 1920

func _process(delta):
	position.x -= scroll_speed
	if position.x < -BACKGROUND_WIDTH:
		position.x += 2 * BACKGROUND_WIDTH
	
