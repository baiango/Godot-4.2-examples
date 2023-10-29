extends Popup


var paused := false
@onready var is_3d_world := $"../..".is_class("Node3D")


func _ready() -> void:
	unpause()


func _process(_delta: float) -> void:
	# TODO: Godot use ESC button to close the window
	# So when you press ESC, the _shortcut_input() will close the window
	# Then, _process() will open the window again
	# Resulting mouse moved to center of the window even if the window is not closed
	# There are no simple workaround for this
	if Input.is_action_just_pressed("ui_cancel"):
		pause()


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://demo/main_menu.tscn")


func _on_resume_pressed():
	hide()


func _on_popup_hide() -> void:
	unpause()


func pause() -> void:
	paused = true
	update_pause()


func unpause() -> void:
	paused = false
	update_pause()


func update_pause() -> void:
	get_tree().set_pause(paused)

	if is_3d_world:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if not paused:
		hide()
		return

	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	show()
