extends Label


@onready var target_node := $"../../../../Target"


func _process(_delta: float) -> void:
	set_text("".join([
		"Position: ", str(target_node.get_global_position())
	]))


func _on_rot_x_value_changed(rotation_x: float) -> void:
	target_node.rotation_degrees.x = rotation_x

func _on_rot_y_value_changed(rotation_y: float) -> void:
	target_node.rotation_degrees.y = rotation_y

func _on_rot_z_value_changed(rotation_z: float) -> void:
	target_node.rotation_degrees.z = rotation_z
