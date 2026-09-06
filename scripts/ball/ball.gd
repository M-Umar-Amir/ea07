extends RigidBody3D

signal delivered

var _origin: Vector3

func _ready() -> void:
	_origin = global_position

func reset_ball(origin: Vector3 = _origin) -> void:
	freeze = true
	linear_velocity = Vector3.ZERO
	angular_velocity = Vector3.ZERO
	global_position = origin

func bowl_towards(target: Vector3, speed: float) -> void:
	reset_ball(global_position)
	freeze = false
	linear_velocity = (target - global_position).normalized() * speed
	delivered.emit()
