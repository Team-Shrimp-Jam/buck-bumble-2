extends Panel
class_name Status

@onready var text = $Text

func add_message(new_text: String):
	text.text += new_text + "\n"

func perform_dance_move(move: DanceMove, is_player_move: bool = true):
	if is_player_move:
		add_message("You performed " + move.name)
	else:
		add_message("The enemy performed " + move.name)