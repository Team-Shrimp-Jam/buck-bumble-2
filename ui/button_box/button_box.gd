extends Panel

@onready var buttons = $ScrollContainer/Buttons
@onready var label = $Label
signal menu_closed
signal move_performed(Move)

func _ready() -> void:
	set_visibility(false)

func set_visibility(is_visible: bool):
	if is_visible:
		mouse_filter = Control.MOUSE_FILTER_STOP
	else:
		mouse_filter = Control.MOUSE_FILTER_IGNORE
		for child in buttons.get_children():
			child.queue_free()
	visible = is_visible

func populate_dance_moves():
	var generic_array: Array[Move] = []
	generic_array.append_array(PlayerMoves.get_dance_moves())
	label.text = "Dance Moves"
	populate_buttons(generic_array)
	
func populate_buttons(moves: Array[Move]):
	for move in moves:
		make_button(move)
	set_visibility(true)
	
func make_button(move: Move) -> Button:
	var button = Button.new()
	button.name = move.name
	button.text = move.name
	#TODO put code to connect this to actual logic
	var button_action = func send_button_action():
		move_performed.emit(move)
	buttons.add_child(button)
	button.pressed.connect(_on_back_pressed)
	button.pressed.connect(button_action)
	return button

func _on_back_pressed() -> void:
	set_visibility(false)
	menu_closed.emit()
