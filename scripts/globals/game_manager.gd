extends Node

@export var player_moves: Array[DanceMove]
@export var default_player_character: Character

# will be used when we we save the game and load it back in, to restore the player's moves
var saved_data = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_player_moves()
	Globals.fill_current_character(load("res://objects/characters/mantussy.tres"))

func load_player_moves() -> void:
	if saved_data != null:
		#reload from saved data
		return
	
	for move in default_player_character.dance_moves:
		#TODO: i think we can eleminate PlayerMoves global, and store all the moves in a character node script, then ui can use the character node to get and show the moves
		PlayerMoves.add(move)



