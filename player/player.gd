# Player script
extends CharacterBody2D

const SPEED = 300.0

func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x = Input.get_axis("Left", "Right")
	var direction_y = Input.get_axis("Up", "Down")
	
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	# Normalizing player velocity, to ensure it moves at the same speed even when moving diagonally
	if velocity.x != 0 and velocity.y != 0:
		normalize_velocity()

	move_and_slide()

func normalize_velocity():
	velocity.x = velocity.x * (sqrt(2) / 2)
	velocity.y = velocity.y * (sqrt(2) / 2)
