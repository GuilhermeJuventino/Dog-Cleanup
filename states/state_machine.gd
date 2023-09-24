# Basic state machine class
extends Node

@export var initial_state: State

var current_state: State
var states: Dictionary = {}

func _ready():
	# Getting all states in the state machine
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			
			# Connecting child State to transitioned signal
			child.Transitioned.connect(on_child_transition)
	
	# Entering initial state
	if initial_state:
		initial_state.enter()
		current_state = initial_state

func _process(delta):
	# Updating non-physics aspects of current state
	if current_state:
		current_state.update(delta)

func _physics_process(delta):
	# Updating physics aspects of current state
	if current_state:
		current_state.physics_update(delta)

func on_child_transition(state, new_state_name):
	# Transitioning between states
	
	# Returning if state is not equal to current state to prevent errors
	if state != current_state:
		return
	
	# Returning if new state variable is empty
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	# Exiting current_state
	if current_state:
		current_state.exit()
	
	# Transitioning to new state
	new_state.enter()
	
	current_state = new_state
