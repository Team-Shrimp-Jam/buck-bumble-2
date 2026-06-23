extends Resource
class_name Character

@export var name: String
@export var pic : Texture2D
@export var lines: DialogueResource

@export var dance_moves: Array[DanceMove]
@export var picker: GenericPicker

func pick_move(state: GameState):
	return picker.pick(dance_moves, state)
