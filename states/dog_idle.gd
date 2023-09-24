# Dog idle state class
extends State
class_name DogIdle

@export var dog: CharacterBody2D

var wait_time: float

func randomize_wait():
	wait_time = randf_range(1, 3)

func enter():
	randomize_wait()

func update(delta: float):
	if wait_time > 0:
		wait_time -= delta
	else:
		Transitioned.emit(self, "DogWander")

func physics_update(_delta: float):
	if dog:
		dog.velocity.x = 0
		dog.velocity.y = 0
