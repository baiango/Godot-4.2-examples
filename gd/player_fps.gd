extends PlayerController



func _ready() -> void:
	mov_param.fly = false


func _process(delta: float) -> void:
	if input_dir != Vector2.ZERO:
		$MeshInstance3D.rotation.y = lerp_angle($MeshInstance3D.rotation.y, cam_rot.y + atan2(input_dir.y, input_dir.x), delta * 4)
	
		var raycast := $MeshInstance3D/Step
		var blocked_raycast := $MeshInstance3D/BlockedStep
		if raycast.is_colliding() and not blocked_raycast.is_colliding():
			impulse_queue.y += 5.0
