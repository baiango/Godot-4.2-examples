class_name PlayerCamera extends Object


class CameraParameters:
	var input_enabled := true
	var mouse_sensitivity: float
	var cam_rot: Vector2
	var event: InputEvent


func handle_camera(param: CameraParameters) -> Vector2:
	if not param.input_enabled:
		return param.cam_rot

	var camera_input: Vector2 = param.event.get_relative()
	param.cam_rot.x += -camera_input.y * param.mouse_sensitivity
	param.cam_rot.y += -camera_input.x * param.mouse_sensitivity
	param.cam_rot.x = clampf(param.cam_rot.x, -PI/2.0, PI/2.0)
	param.cam_rot.y = wrapf(param.cam_rot.y, 0.0, TAU)

	return param.cam_rot
