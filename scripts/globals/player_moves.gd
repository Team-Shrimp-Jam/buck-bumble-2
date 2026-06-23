extends Node

var dance_moves: Dictionary[String, DanceMove]

func add(move: DanceMove):
	dance_moves[move.name] = move

func get_move(move_name: String) -> DanceMove:
	return dance_moves.get(move_name, null)

func get_dance_moves() -> Array[DanceMove]:
	return dance_moves.values()
