class_name PlayerPhysics extends Object


class PhysicsParameters:
	var fly := true
	var on_floor := false
	var delta := 0.0
	var speed := 0.0
	var gravity := 0.0
	var jump_velocity := 0.0
	var input_dir: Vector2
	var cam_rot: Vector2
	var cam_arm: Node3D


var result: Vector3


# Factory pattern
func handle_move(param: PhysicsParameters) -> Vector3:
	if param.fly:
		_flight(param)
	else:
		_walk(param)
	
	return result


func _flight(param: PhysicsParameters) -> void:
		result = result.lerp(Vector3.ZERO, param.delta * 5.0)
		result.y += Input.get_axis("q", "e") * param.delta * param.speed
		result += (
			param.cam_arm.transform.basis.z * param.input_dir.x +
			param.cam_arm.transform.basis.x * param.input_dir.y
		) * param.delta * param.speed * (1.0 + Input.get_action_strength("shift") * 5.0)


func _walk(param: PhysicsParameters) -> void:
	var rot_y := Basis(
		Vector3(cos(param.cam_rot.y), 0.0, -sin(param.cam_rot.y)),
		Vector3(0.0, 1.0, 0.0),
		Vector3(sin(param.cam_rot.y), 0.0, cos(param.cam_rot.y))
	)
	result = _lerp3_xz(result, Vector3.ZERO, param.delta * 5.0)
	# XZ-axis
	result += (
		rot_y.z * param.input_dir.x +
		rot_y.x * param.input_dir.y
	) * param.delta * param.speed

	# Y-axis
	result.y -= param.gravity * param.delta
	result.y = clampf(result.y, -55.0, 55.0)

	if param.on_floor:
		result.y = Input.get_action_strength(" ") * param.jump_velocity


func _lerp3_xz(from: Vector3, to: Vector3, weight: float) -> Vector3:
	from.x = lerpf(from.x, to.x, weight)
	from.z = lerpf(from.z, to.x, weight)
	return from
