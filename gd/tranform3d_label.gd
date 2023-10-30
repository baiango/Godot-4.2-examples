extends Label


@onready var target_node := $"../../../../Target"


func _process(_delta: float) -> void:
	var prt_origin: Vector3 = target_node.get_transform().origin
	var prt_basis: Basis = target_node.get_transform().basis
	set_text("".join([
		"Position: ", target_node.get_global_position(), "\n",
		"Scale: ", target_node.get_scale(), "\n",
		"Rotation_degrees: ", target_node.get_rotation_degrees(), "\n",
		"Transform3D: ",
		prt_basis.x.snapped(vec3_from_float(0.001)), ", ", snappedf(prt_origin.x, 0.01), "\n",
		prt_basis.y.snapped(vec3_from_float(0.001)), ", ", snappedf(prt_origin.y, 0.01), "\n",
		prt_basis.z.snapped(vec3_from_float(0.001)), ", ", snappedf(prt_origin.z, 0.01), "\n",
	]))


func vec3_from_float(value: float):
	return Vector3(value, value, value)


func _on_pos_x_value_changed(position_x: float) -> void:
	target_node.position.x = position_x

func _on_pos_y_value_changed(position_y: float) -> void:
	target_node.position.y = position_y

func _on_pos_z_value_changed(position_z: float) -> void:
	target_node.position.z = position_z


func _on_scl_x_value_changed(scale_x: float) -> void:
	target_node.scale.x = scale_x

func _on_scl_y_value_changed(scale_y: float) -> void:
	target_node.scale.y = scale_y

func _on_scl_z_value_changed(scale_z: float) -> void:
	target_node.scale.z = scale_z


func _on_rot_x_value_changed(rotation_x: float) -> void:
	target_node.rotation_degrees.x = rotation_x

func _on_rot_y_value_changed(rotation_y: float) -> void:
	target_node.rotation_degrees.y = rotation_y

func _on_rot_z_value_changed(rotation_z: float) -> void:
	target_node.rotation_degrees.z = rotation_z
