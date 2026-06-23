extends Node
class_name GameState

var turn_count: int
var respect: float

func update_turn_count(new_turn: int):
	turn_count = new_turn
	
func update_respect(new_respect: float):
	respect = new_respect
