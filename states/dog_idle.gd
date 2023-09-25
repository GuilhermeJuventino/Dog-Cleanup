# Dog idle state class
extends State
class_name DogIdle

@export var dog: CharacterBody2D

var wait_time: float

func randomize_wait():
	wait_time = randf_range(1, 3)

func enter():
	# Randomizing the amount of time the dog will stay in idle state
	randomize_wait()

func update(delta: float):
	# Checking if wait time has expired and transitioning to wander state if necessary
	if wait_time > 0:
		wait_time -= delta
	else:
		Transitioned.emit(self, "DogWander")

func physics_update(_delta: float):
	# Keeping dog's velocity to 0 during idle state to prevent it from moving while waiting
	if dog:
		dog.velocity.x = 0
		dog.velocity.y = 0
