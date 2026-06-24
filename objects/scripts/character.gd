extends Resource
class_name Character

@export var name: String
@export var pic : Texture2D
@export var lines: DialogueResource

@export var dance_moves: Array[DanceMove]
@export var picker: GenericPicker
@export var max_fatigue: float
var fatigue: float
signal sleepy
signal fatigue_changed(new_fatigue: float)

func _init():
	fatigue = max_fatigue

func pick_move(fight_manager: FightManager):
	var move_array: Array[Move] = []
	move_array.append_array(dance_moves)
	return picker.pick(move_array, fight_manager)
	
func change_fatigue(new_fatigue: float):
	fatigue = new_fatigue
	if fatigue <= 0:
		fatigue = 0
		sleepy.emit()
	fatigue_changed.emit(fatigue)
	
