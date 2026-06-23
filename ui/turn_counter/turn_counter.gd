extends Label

@onready var whose_turn = $WhoseTurn

func update_counter(turn_count: int):
	text = "Turn Count: " + str(turn_count) 
	
func set_whose_turn(is_your_turn: bool):
	if is_your_turn:
		whose_turn.text = "Your Turn"
	else:
		whose_turn.text = "Opponent's Turn"
