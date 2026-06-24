extends GenericPicker
class_name SelectionPicker
"""haha this is entirely fake but for consistency's sake lets do it"""

func pick(array: Array[Move], fight_manager: FightManager) -> Move:
	return fight_manager.selected_move
