extends Node2D

@export var assignment_scene: PackedScene

var score ## Number of Assignments collected
var num_assignments_missed

const height_low_bound = 200 # (720-256)-256
const height_high_bound = 464

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


## Called when restarting
func new_game():
	score = 0
	num_assignments_missed = 0
	$Player.start($PlayerStartPosition.position)
	

############### Assignment Spawning ##################
func spawn_assignment():
	var assignment = assignment_scene.instantiate() # create a new instance of Assignment scene
	
	var assignment_location = $SpawningArea/SpawningLocation
	assignment_location.progress_ratio = randf()
	
	assignment.position = assignment_location.position
	
	add_child(assignment)
	
func _on_assignment_timer_timeout():
	spawn_assignment()
