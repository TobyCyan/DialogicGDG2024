class_name Conversation

const StartDialogue = preload("res://Dialogue/game_dialogue.dialogue")
const OptionDialogue = preload("res://Dialogue/option.dialogue")
const ReceivedDialogue = preload("res://Dialogue/receive.dialogue")

static func create(dialogue_name: String, game_tree):
	var dialogue_resource = Resource
	match dialogue_name:
		"start":
			dialogue_resource = StartDialogue
		
		"option":
			dialogue_resource = OptionDialogue
			
		"receive":
			dialogue_resource = ReceivedDialogue
			
	var Dialogue = DialogueManager.show_dialogue_balloon(dialogue_resource)
	game_tree.paused = true
	Dialogue.process_mode = Node.PROCESS_MODE_ALWAYS
	Dialogue.tree_exited.connect(func(): Conversation.resume(game_tree))
	
static func resume(game_tree: SceneTree):
	game_tree.paused = false
