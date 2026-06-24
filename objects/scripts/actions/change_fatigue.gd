extends Action
class_name ChangeFatigue

@export var fatigue_decrease: float

func perform(fight_manager: FightManager):
	var new_fatigue = fight_manager.active_character.fatigue - fatigue_decrease
	fight_manager.active_character.change_fatigue(new_fatigue)
