class_name State

var is_grass_taken: bool = false

# Signal declaration
signal grass_taken 

var is_completed: bool = false
signal grass_completed

# Instatiate new static state instance
static var instance = State.new()

static func get_instance():
	return State.instance
	
func take_grass():
	is_grass_taken = true
	grass_taken.emit() # emit signal to notify the change in state and call all functions connected to it
	
func complete_grass():
	is_completed = true
	grass_completed.emit() # emit signal to notify the change in state and call all functions connected to it
	

	

