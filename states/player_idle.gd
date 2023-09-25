extends State
class_name PlayerIdle

@export var player: CharacterBody2D

func enter():
	print("Entered PlayerIdle")

func update(_delta: float):
	if player:		
		if Input.is_action_pressed("Left") or Input.is_action_pressed("Right"):
			Transitioned.emit(self, "PlayerMove")
		elif Input.is_action_pressed("Up") or Input.is_action_pressed("Down"):
			Transitioned.emit(self, "PlayerMove")
		

func physics_update(_delta: float):
	pass
