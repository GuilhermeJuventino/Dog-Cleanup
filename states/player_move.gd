extends State
class_name PlayerMove

@export var player: CharacterBody2D
@export var move_speed = 300.0

func normalize_velocity():
	player.velocity.x = player.velocity.x * (sqrt(2) / 2)
	player.velocity.y = player.velocity.y * (sqrt(2) / 2)

func enter():
	print("Entered PlayerMove")

func update(_delta: float):
	if player:
		if player.velocity.x == 0 and player.velocity.y == 0:
			Transitioned.emit(self, "PlayerIdle")

func physics_update(_delta: float):
	if player:
		var direction_x = Input.get_axis("Left", "Right")
		var direction_y = Input.get_axis("Up", "Down")
		
		if direction_x:
			player.velocity.x = direction_x * move_speed
		else:
			player.velocity.x = move_toward(player.velocity.x, 0, move_speed)
		
		if direction_y:
			player.velocity.y = direction_y * move_speed
		else:
			player.velocity.y = move_toward(player.velocity.y, 0, move_speed)
		
		# Normalizing player velocity, to ensure it moves at the same speed even when moving diagonally
		if player.velocity.x != 0 and player.velocity.y != 0:
			normalize_velocity()
