extends Node

enum GameState {
	BOOT,
	MENU,
	MATCH
}

signal state_changed(new_state: GameState)

var current_state: GameState = GameState.BOOT

func goto_menu() -> void:
	_change_state(GameState.MENU, "res://scenes/menu/menu.tscn")

func start_match() -> void:
	_change_state(GameState.MATCH, "res://scenes/match/match.tscn")

func _change_state(new_state: GameState, scene_path: String) -> void:
	if current_state == new_state:
		return
	current_state = new_state
	get_tree().change_scene_to_file(scene_path)
	state_changed.emit(current_state)
