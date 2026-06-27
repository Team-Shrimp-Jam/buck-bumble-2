extends Node

@export var player_moves: Array[DanceMove]

# will be used when we we save the game and load it back in, to restore the player's moves
var saved_data = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_player_moves()

func load_player_moves() -> void:
	if saved_data != null:
		#reload from saved data
		return
	
	for move in player_moves:
		PlayerMoves.add(move)



