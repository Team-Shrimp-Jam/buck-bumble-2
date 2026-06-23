extends Panel

@onready var buttons = $ScrollContainer/Buttons
signal menu_closed


func _ready() -> void:
	set_visibility(false)

func set_visibility(is_visible: bool):
	if is_visible:
		mouse_filter = Control.MOUSE_FILTER_STOP
	else:
		mouse_filter = Control.MOUSE_FILTER_IGNORE
	visible = is_visible
	
func populate_buttons(moves: Array[Move]):
	for move in moves:
		make_button(move)
	set_visibility(true)
	
func make_button(move: Move) -> Button:
	var button = Button.new()
	button.name = move.name
	button.text = move.name
	#TODO put code to connect this to actual logic
	buttons.add_child(button)
	button.pressed.connect(_on_back_pressed)
	return button

func _on_back_pressed() -> void:
	set_visibility(false)
	menu_closed.emit()
