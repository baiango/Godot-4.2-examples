extends PlayerController
# Multiple inheritance


func _ready() -> void:
	mov_param.fly = false


func _process(delta: float) -> void:
	handle_animation(delta)


func handle_animation(delta: float) -> void:
	# --- Mesh --- #
	var ske := $CollisionShape3D/MeshInstance3D
	if input_dir != Vector2.ZERO:
		ske.rotation.y = lerp_angle(ske.rotation.y, cam_rot.y + atan2(input_dir.y, input_dir.x), delta * 4)
