extends Action
class_name ChangeRespect

@export var respect_increase: float = 5.0
signal respect_changed(new_respect)

func perform(fight_manager: FightManager):
	if fight_manager.your_turn:
		fight_manager.respect += respect_increase
	else:
		fight_manager.respect -= respect_increase
