extends HBoxContainer


@export var target_node: Node3D
@export var defult_val := 1.0
@export var min_val := 0.0
@export var max_val := 100.0
@export var step_val := 0.1


var hold := false
var prev_mouse_position := Vector2.ZERO
var vec_multiply := Vector3.ZERO
var target_button := -1
var target_vec := Vector3.ZERO
var target_axis := -1
var click_count := 0


func _ready() -> void:
	$Left/Name.set_text(name)


func _process(_delta: float) -> void:
	if Input.is_action_pressed("lmb") and hold:
		handle_vec()
	if Input.is_action_just_released("lmb"):
		hold = false
		target_axis = -1
	if Input.is_action_just_pressed("lmb"):
		click_count += 1
		if click_count >= 2 and not $DoubleClick.is_stopped():
			click_count = 0
			target_node.set(
				name.to_lower(),
				Vector3.ONE * defult_val
			)
			#for i in vec_multiply:
				#pass
		$DoubleClick.start()

	if not target_node:
		return

	var stat: Vector3 = target_node.get(name.to_lower())
	$Right/X.set_text(str(snappedf(stat.x, 0.001)).pad_decimals(3))
	$Right/Y.set_text(str(snappedf(stat.y, 0.001)).pad_decimals(3))
	$Right/Z.set_text(str(snappedf(stat.z, 0.001)).pad_decimals(3))


func handle_vec() -> void:
	var mouse_pos := get_viewport().get_mouse_position()
	target_node.set(
		name.to_lower(),
		target_vec
		+ Vector3.ONE * (mouse_pos.x - prev_mouse_position.x) * step_val
		* vec_multiply
	)


func _on_x_button_down() -> void:
	init_hold()
	vec_multiply = Vector3(1.0, 0.0, 0.0)

func _on_y_button_down() -> void:
	init_hold()
	vec_multiply = Vector3(0.0, 1.0, 0.0)

func _on_z_button_down() -> void:
	init_hold()
	vec_multiply = Vector3(0.0, 0.0, 1.0)


func init_hold() -> void:
	if not target_node:
		return

	hold = true
	prev_mouse_position = get_viewport().get_mouse_position()
	target_vec = target_node.get(name.to_lower())
