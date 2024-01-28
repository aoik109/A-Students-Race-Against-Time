extends Node2D

@export var assignment_scene: PackedScene
@export var chore_scene: PackedScene
@export var distraction_scene: PackedScene
@export var soap_scene: PackedScene

var score ## Number of Assignments collected
var num_assignments_missed

const height_low_bound = 200 # (720-256)-256
const height_high_bound = 464

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player/AnimatedSprite2D.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


## Called when restarting
func new_game():
	score = 0
	num_assignments_missed = 0
	$AssignmentTimer.start()
	$ChoreTimer.start()
	$DistractionTimer.start()
	$SoapTimer.start()
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

func spawn_chore():
	var chore = chore_scene.instantiate() # create a new instance of Assignment scene
	var chore_location = $SpawningArea/SpawningLocation
	chore_location.progress_ratio = randf()
	chore.position = chore_location.position
	add_child(chore)

func _on_chore_timer_timeout():
	spawn_chore()

func spawn_distraction():
	var distraction = distraction_scene.instantiate() # create a new instance of Assignment scene
	var distraction_location = $SpawningArea/SpawningLocation
	distraction_location.progress_ratio = randf()
	distraction.position = distraction_location.position
	add_child(distraction)

func _on_distraction_timer_timeout():
	spawn_distraction()

func spawn_soap():
	var soap = soap_scene.instantiate() # create a new instance of Assignment scene
	var soap_location = $SpawningArea/SpawningLocation
	soap_location.progress_ratio = randf()
	soap.position = soap_location.position
	add_child(soap)


func _on_soap_timer_timeout():
	spawn_soap()


func _on_start_timer_timeout():
	$HUD.hide()
	new_game()
