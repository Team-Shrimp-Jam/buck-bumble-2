extends GenericPicker
class_name RandomPicker

func pick(array: Array[Move], fight_manager: FightManager) -> Move:
	return array.pick_random()
