extends PlayerController
# Multiple inheritance


var gmm := GMM.new()


func _ready() -> void:
	mov_param.fly = false


func _process(delta: float) -> void:
	handle_animation(delta)


func handle_animation(delta: float) -> void:
	# --- Rotate mesh --- #
	var ske := $kira/Skeleton3D as Node3D
	
	# --- Idle & Walk animarion blend --- #
	var ani := $AnimationPlayer/AnimationTree as AnimationTree
	var walk_blend := ani["parameters/Walk_blnd/blend_amount"] as float
	ani["parameters/Walk_blnd/blend_amount"] = gmm.linear_lerpf(
		walk_blend, 1.0, 0.0, delta * 5.0
	)

	if not input_dir:
		return

	ske.rotation.y = lerp_angle(ske.rotation.y, cam_rot.y + atan2(input_dir.y, input_dir.x), delta * 4)
	ani["parameters/Walk_blnd/blend_amount"] = gmm.linear_lerpf(
		walk_blend, 0.0, 1.0, delta * 5.0
	)
