# Basic state class
extends Node
class_name State

# Signal used for transitioning between states
signal Transitioned

func enter():
	# For entering a new state
	pass

func exit():
	# For exiting current state
	pass

func update(_delta: float):
	# For updating non-physics related aspects of current state
	pass

func physics_update(_delta: float):
	# For updating physics related aspects of current state
	pass
