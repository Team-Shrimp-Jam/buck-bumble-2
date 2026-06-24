extends Node
class_name FightManager

var selected_move: Move
var turn_number : int = 1 
var your_turn : bool = true
@export var starting_respect: float = 40.0
@export var player_character: Character
@export var enemy_character: Character
var respect: float
signal turn_count_changed(turn_count: int)
signal whose_turn_changed(is_your_turn: bool)
var internal_state: GameState 

@onready var turn_change_timer = $Timers/TurnChangeTimer

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
	
func select_move(move: Move):
	selected_move = move
	pick_and_perform_move(player_character)
	
func pick_and_perform_move(char: Character):
	var move = char.pick_move(self)
	
	turn_change_timer.start()

func perform_observe():
	turn_change_timer.start()


func _on_opponents_turn() -> void:
	pass


func _on_turn_change_timer_timeout() -> void:
	increment_turn()
