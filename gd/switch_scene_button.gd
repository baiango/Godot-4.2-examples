extends Button


# Drag your scene to this variable in the Inspector tab
@export var scene_file: Resource


func _ready() -> void:
	connect("pressed", _on_pressed)


func _on_pressed():
	get_tree().change_scene_to_file(scene_file.get_path())
