extends Node

var current_character: Character
var has_current_character = false

func fill_current_character(new_character: Character):
	current_character = new_character
	has_current_character = true
	
func clear_current_character():
	current_character = null
	has_current_character = false
