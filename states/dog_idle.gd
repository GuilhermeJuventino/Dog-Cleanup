extends State
class_name DogIdle

@export var dog: CharacterBody2D
@export var move_speed := 70.0

var move_direction: Vector2
var wander_time: float

func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_time = randf_range(1, 3)

func enter():
	randomize_wander()

func update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()

func physics_update(_delta: float):
	if dog:
		dog.velocity = move_direction * move_speed
