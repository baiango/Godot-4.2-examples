extends PlayerController


func _process(_delta: float) -> void:
	mov_param.input_enabled = false
	cam_param.input_enabled = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	if Input.is_action_pressed("rmb"):
		mov_param.input_enabled = true
		cam_param.input_enabled = true
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
