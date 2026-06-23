extends Node

var turn_number : int = 1 
var your_turn : bool = true
signal turn_count_changed(turn_count: int)
signal whose_turn_changed(is_your_turn: bool)

func _ready() -> void:
	turn_count_changed.emit(turn_number)
	whose_turn_changed.emit(your_turn)

func increment_turn():
	if your_turn:
		your_turn = false
		whose_turn_changed.emit(your_turn)
	else:
		turn_number += 1
		your_turn = true
		whose_turn_changed.emit(your_turn)
		turn_count_changed.emit(turn_number)
		
func perform_move(move: Move):
	increment_turn()

func perform_observe():
	increment_turn()
