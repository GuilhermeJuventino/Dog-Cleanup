# Dog wander state class
extends State
class_name DogWander

@export var dog: CharacterBody2D
@export var move_speed := 70.0

var move_direction: Vector2
var wander_time: float

func randomize_wander():
	# Randomizing the direction the dog will wander to and for how long it will move in that direction
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_time = randf_range(1, 3)

func enter():
	# Randomizing dog's wander direction and time upon entering wander state
	randomize_wander()

func update(delta: float):
	# Updating wander time and transitioning to idle state after wander time expires
	if wander_time > 0:
		wander_time -= delta
	else:
		Transitioned.emit(self, "DogIdle")

func physics_update(_delta: float):
	# Updating dog's position
	if dog:
		dog.velocity = move_direction * move_speed
