extends Node2D

@onready var ui = $UI
@onready var fight_manager = $FightManager

func _ready():
	#TODO: probably can move to game manager currently when all scenes have their own setup everywhere it makes it so hard to track where something is set
	fight_manager.whose_turn_changed.connect(ui.swap_sides)
	fight_manager.turn_count_changed.connect(ui.set_turn)
	ui.move_performed.connect(fight_manager.select_move)
	ui.observe_performed.connect(fight_manager.perform_observe)
