extends Popup


var paused := false
@onready var is_3d_world := $"../..".is_class("Node3D")


func _ready() -> void:
	paused = true
	flip_pause()


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		flip_pause()


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://demo/main_menu.tscn")


func _on_popup_hide() -> void:
	flip_pause()


func flip_pause() -> void:
	paused = not paused
	get_tree().set_pause(paused)

	if is_3d_world:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if not paused:
		hide()
		return

	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	show()
