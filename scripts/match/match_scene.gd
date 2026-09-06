extends Node3D

@onready var ball: RigidBody3D = $Ball
@onready var batter: Node3D = $Batter
@onready var bowler: Node3D = $Bowler
@onready var instructions: Label = $CanvasLayer/Instructions

var _awaiting_delivery: bool = true

func _ready() -> void:
	_reset_for_next_delivery()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		_attempt_shot()
	elif event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		_bowl_ball()
	elif event is InputEventKey and event.pressed and event.keycode == KEY_R:
		GameStateManager.goto_menu()

func _physics_process(_delta: float) -> void:
	if _awaiting_delivery:
		return

	if ball.global_position.z > batter.global_position.z + 4.0:
		instructions.text = "Ball completed. Press SPACE to bowl next delivery."
		_reset_for_next_delivery()

func _bowl_ball() -> void:
	if not _awaiting_delivery:
		return
	var target: Vector3 = batter.global_position + Vector3(0, 0.2, 0)
	ball.call("bowl_towards", target, bowler.call("bowl_speed"))
	_awaiting_delivery = false
	instructions.text = "Delivery in progress... Press ENTER to attempt shot."

func _attempt_shot() -> void:
	if _awaiting_delivery:
		return
	if batter.call("is_shot_timed", ball.global_position):
		var shot_vector := Vector3(randf_range(-0.5, 0.5), 0.5, 1.0).normalized() * 14.0
		ball.apply_central_impulse(shot_vector)
		instructions.text = "Good timing! Shot connected."
	else:
		instructions.text = "Missed timing."

func _reset_for_next_delivery() -> void:
	_awaiting_delivery = true
	ball.call("reset_ball", bowler.global_position + Vector3(0, 0.1, 1.0))
	instructions.text = "SPACE: Bowl | ENTER: Shot | R: Return to Menu"
