extends Control

@onready var quick_match_button: Button = %QuickMatchButton
@onready var exit_button: Button = %ExitButton

func _ready() -> void:
	quick_match_button.pressed.connect(_on_quick_match_pressed)
	exit_button.pressed.connect(_on_exit_pressed)

func _on_quick_match_pressed() -> void:
	GameStateManager.start_match()

func _on_exit_pressed() -> void:
	get_tree().quit()
