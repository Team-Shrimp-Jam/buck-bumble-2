extends CanvasLayer

@onready var respect_meter = $UI/RespectMeter
@onready var status = $UI/Status
@onready var main_buttons = $UI/MainButtons
@onready var turn_counter = $UI/TurnCounter
@onready var button_box = $UI/ButtonBox

signal move_performed(move: Move)
signal observe_performed

func _ready() -> void:
	button_box.move_performed.connect(perform_move)
	
func perform_move(move: Move):
	move_performed.emit(move)
	status.perform_dance_move(move)
	hide_main_buttons()

func set_turn(turn_count: int):
	turn_counter.update_counter(turn_count)

func swap_sides(is_your_turn: bool):
	turn_counter.set_whose_turn(is_your_turn)
	if is_your_turn:
		show_main_buttons()
		
	
func update_respect(respect: float):
	respect_meter.update(respect)

func add_line_to_status(line: String):
	status.add_message(line)

func show_dance_menu():
	button_box.populate_dance_moves()

func hide_button_box():
	button_box.set_visibility(false)
	
func hide_main_buttons():
	main_buttons.set_visibility(false)

func show_main_buttons():
	main_buttons.set_visibility(true)


func _on_main_buttons_dance_clicked() -> void:
	show_dance_menu()


func _on_main_buttons_item_clicked() -> void:
	pass # Replace with function body.


func _on_main_buttons_observe_clicked() -> void:
	observe_performed.emit()


func _on_button_box_menu_closed() -> void:
	show_main_buttons()
