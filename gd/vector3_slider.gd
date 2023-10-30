extends HBoxContainer


var gmm := GMM.new()


@export var target_node: Node3D
@export var defult_val := 1.0
@export var min_val := 0.0
@export var max_val := 100.0
@export var step_val := 0.1


var hold := false
var initial_mouse_position := Vector2.ZERO
var initial_target_vec := Vector3.ZERO
var click_count := 0
var is_button_down := Vector3.ZERO
var is_focused := Vector3.ZERO
var is_hovered := Vector3.ZERO


func _ready() -> void:
	$Left/Name.set_text(get_name())
	$Right/X.button_down.connect(_on_x_button_down)
	$Right/Y.button_down.connect(_on_y_button_down)
	$Right/Z.button_down.connect(_on_z_button_down)
	$Right/X.focus_entered.connect(_on_x_focus_entered)
	$Right/Y.focus_entered.connect(_on_y_focus_entered)
	$Right/Z.focus_entered.connect(_on_z_focus_entered)
	$Right/X.focus_exited.connect(_on_x_focus_exited)
	$Right/Y.focus_exited.connect(_on_y_focus_exited)
	$Right/Z.focus_exited.connect(_on_z_focus_exited)
	$Right/X.mouse_entered.connect(_on_x_mouse_entered)
	$Right/Y.mouse_entered.connect(_on_y_mouse_entered)
	$Right/Z.mouse_entered.connect(_on_z_mouse_entered)
	$Right/X.mouse_exited.connect(_on_x_mouse_exited)
	$Right/Y.mouse_exited.connect(_on_y_mouse_exited)
	$Right/Z.mouse_exited.connect(_on_z_mouse_exited)


func _process(_delta: float) -> void:
	if Input.is_action_pressed("lmb") and hold:
		handle_vec()
	if Input.is_action_just_released("lmb"):
		hold = false
	if Input.is_action_just_pressed("lmb"):
		update_click()

	if not target_node:
		return
	var stat: Vector3 = target_node.get(get_name().to_lower())
	$Right/X.set_text(str(snappedf(stat.x, 0.001)).pad_decimals(3))
	$Right/Y.set_text(str(snappedf(stat.y, 0.001)).pad_decimals(3))
	$Right/Z.set_text(str(snappedf(stat.z, 0.001)).pad_decimals(3))


func handle_vec() -> void:
	var current_mouse_pos := get_viewport().get_mouse_position()
	var mouse_pos_difference := current_mouse_pos.x - initial_mouse_position.x
	var mouse_pos_distance := initial_mouse_position.distance_to(current_mouse_pos)

	if mouse_pos_distance >= 10.0:
		target_node.set(
			get_name().to_lower(),
			initial_target_vec
			+ Vector3.ONE * mouse_pos_difference * step_val
			* is_button_down
		)


func update_click() -> void:
	click_count += 1
	if click_count >= 2 and not $DoubleClick.is_stopped():
		click_count = 0

		var target_node_vec: Vector3 = target_node.get(get_name().to_lower())
		var is_focused_and_hovered_xor := gmm.xor_vec3(is_focused * is_hovered, Vector3.ONE)

		target_node.set(
			get_name().to_lower(),
			target_node_vec
			* is_focused_and_hovered_xor
			+ is_focused * defult_val
		)
	$DoubleClick.start()


func init_hold() -> void:
	if not target_node:
		return

	hold = true
	initial_mouse_position = get_viewport().get_mouse_position()
	initial_target_vec = target_node.get(get_name().to_lower())


func _on_x_button_down() -> void:
	init_hold()
	is_button_down = Vector3(1.0, 0.0, 0.0)

func _on_y_button_down() -> void:
	init_hold()
	is_button_down = Vector3(0.0, 1.0, 0.0)

func _on_z_button_down() -> void:
	init_hold()
	is_button_down = Vector3(0.0, 0.0, 1.0)


func _on_x_focus_entered() -> void:
	is_focused.x = gmm.TRUE

func _on_y_focus_entered() -> void:
	is_focused.y = gmm.TRUE

func _on_z_focus_entered() -> void:
	is_focused.z = gmm.TRUE


func _on_x_focus_exited() -> void:
	is_focused.x = gmm.FALSE

func _on_y_focus_exited() -> void:
	is_focused.y = gmm.FALSE

func _on_z_focus_exited() -> void:
	is_focused.z = gmm.FALSE


func _on_x_mouse_entered() -> void:
	is_hovered.x = gmm.TRUE

func _on_y_mouse_entered() -> void:
	is_hovered.y = gmm.TRUE

func _on_z_mouse_entered() -> void:
	is_hovered.z = gmm.TRUE

func _on_x_mouse_exited() -> void:
	is_hovered.x = gmm.FALSE

func _on_y_mouse_exited() -> void:
	is_hovered.y = gmm.FALSE

func _on_z_mouse_exited() -> void:
	is_hovered.z = gmm.FALSE
