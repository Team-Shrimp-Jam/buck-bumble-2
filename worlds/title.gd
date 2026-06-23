extends Control

@export var starting_player_moves: Array[DanceMove]
func _on_play_pressed() -> void:
	##ALL GAME START STUFF HERE FOR NOW
	Globals.fill_current_character(load("res://objects/characters/mantussy.tres"))
	for move in starting_player_moves:
		PlayerMoves.add(move)
	get_tree().change_scene_to_file("res://worlds/dialogue_world.tscn")
