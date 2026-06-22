extends Control

@onready var background = $Background
@onready var character_image = $Character

@export var test_character: Character
@export var use_test_character = false

func _ready() -> void:
	if !Globals.has_current_character and use_test_character:
		setup_character(test_character)
	elif !use_test_character:
		setup_character(Globals.current_character)
	else:
		assert("No character loaded from last scene OR from test")

func setup_character(character: Character):
	Globals.fill_current_character(character)
	character_image = character.pic
	DialogueManager.show_dialogue_balloon(character.lines)
	DialogueManager.dialogue_ended.connect(go_to_fight)
	
	
	
func go_to_fight(dialogue_resource: DialogueResource):
	get_tree().change_scene_to_file("res://worlds/fight_world.tscn")
