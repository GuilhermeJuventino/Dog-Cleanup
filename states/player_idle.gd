# Player idle state class
extends State
class_name PlayerIdle

@export var player: CharacterBody2D

func enter():
	# Debug print to check if player entered this state
	print("Entered PlayerIdle")

func update(_delta: float):
	# Checking if any movement action has been pressed, and changing to move state if necessary
	if player:		
		if Input.is_action_pressed("Left") or Input.is_action_pressed("Right"):
			Transitioned.emit(self, "PlayerMove")
		elif Input.is_action_pressed("Up") or Input.is_action_pressed("Down"):
			Transitioned.emit(self, "PlayerMove")
		
func physics_update(_delta: float):
	pass
