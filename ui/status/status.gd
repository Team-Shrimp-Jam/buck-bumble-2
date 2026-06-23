extends Panel
class_name Status

@onready var text = $Text

func add_message(new_text: String):
	text.text += new_text + "\n"
