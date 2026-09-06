extends Node3D

@export var hit_window: float = 0.8

func is_shot_timed(ball_position: Vector3) -> bool:
	return global_position.distance_to(ball_position) <= hit_window
