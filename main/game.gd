extends Node2D

func _ready():
	# Connects functions to a signal and calls the function when signal is emitted
	State.get_instance().grass_taken.connect(take_grass)
	State.get_instance().grass_completed.connect(complete_grass)
	
func _on_start_timer_timeout():
	trigger_dialogue("start")

func trigger_dialogue(Dialogue_name: String):
	Conversation.create(Dialogue_name, get_tree())
	
func take_grass():
	$TriggerCollect.queue_free() #Deletes a node and all of its child nodes
	
func complete_grass():
	$TriggerComplete.queue_free()	



