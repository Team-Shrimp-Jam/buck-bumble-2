extends Node
class_name FightManager

var selected_move: Move
var turn_number : int = 1 
var your_turn : bool = true
@export var starting_respect: float = 40.0
@export var player_character: Character
var enemy_character: Character
var active_character: Character
var inactive_character: Character
var respect: float
signal turn_count_changed(turn_count: int)
signal whose_turn_changed(is_your_turn: bool)
signal respect_changed(new_respect: float)
signal enemy_performed_move(move: Move)

@onready var turn_change_timer: Timer = $Timers/TurnChangeTimer

func _ready() -> void:
	respect = starting_respect
	enemy_character = Globals.current_character
	active_character = player_character
	inactive_character = enemy_character
	turn_count_changed.emit(turn_number)
	whose_turn_changed.emit(your_turn)
	whose_turn_changed.connect(on_turn_changed)
	# turn_change_timer.timeout.connect(_on_turn_change_timer_timeout)


func on_turn_changed(is_player_turn: bool) -> void:
	if is_player_turn == false:
		handle_enemy_turn()
		return

func increment_turn():
	if your_turn:
		your_turn = false
		active_character = enemy_character
		inactive_character = player_character
	else:
		turn_number += 1
		your_turn = true
		active_character = player_character
		inactive_character = enemy_character
	whose_turn_changed.emit(your_turn)
	turn_count_changed.emit(turn_number)
	
func select_move(move: Move):
	selected_move = move
	pick_and_perform_move(player_character)
	
func pick_and_perform_move(char: Character):
	var move = char.pick_move(self)
	start_timer_with_move(move)

func handle_enemy_turn():
	var move = enemy_character.pick_move(self)
	enemy_performed_move.emit(move)
	start_timer_with_move(move)

func perform_observe():
	turn_change_timer.start()

func handle_end():
	if respect <= 0:
		pass #loss
	elif respect >= 100:
		pass #win
func _on_opponents_turn() -> void:
	pass


func _on_turn_change_timer_timeout() -> void:
	increment_turn()

func start_timer_with_move(move: Move) -> void:
	turn_change_timer.start()
	turn_change_timer.timeout.connect(
			func(): _on_turn_change_timer_timeout_with_move(move),
			Object.CONNECT_ONE_SHOT
		)

func _on_turn_change_timer_timeout_with_move(move: Move) -> void:
	#TODO: Implement move action logic
	increment_turn()