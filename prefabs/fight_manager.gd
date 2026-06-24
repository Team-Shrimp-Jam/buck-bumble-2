extends Node
class_name FightManager

var turn_number : int = 1 
var your_turn : bool = true
@export var starting_respect: float = 40.0
var respect: float
signal turn_count_changed(turn_count: int)
signal whose_turn_changed(is_your_turn: bool)
var internal_state: GameState 

func _ready() -> void:
	respect = starting_respect
	turn_count_changed.emit(turn_number)
	whose_turn_changed.emit(your_turn)
	internal_state = GameState.new(turn_number, respect)

func increment_turn():
	if your_turn:
		your_turn = false
	else:
		turn_number += 1
		your_turn = true
	internal_state.update_turn_count(turn_number)
	whose_turn_changed.emit(your_turn)
	turn_count_changed.emit(turn_number)
	
func perform_move(move: Move):
	increment_turn()

func perform_observe():
	increment_turn()


func _on_opponents_turn() -> void:
	pass
