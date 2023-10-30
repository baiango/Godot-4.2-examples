@tool extends HBoxContainer


@export var target_node: Node3D


func _ready() -> void:
	$Left/Name.set_text(name)


func _on_x_button_down():
	target_node.set(name.to_lower(),
		target_node.get(name.to_lower())
		+ Vector3(10.0, 0.0, 0.0)
	)


func _on_y_button_down():
	pass # Replace with function body.


func _on_z_button_down():
	pass # Replace with function body.
