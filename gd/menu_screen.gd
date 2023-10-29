extends Control


func _on_mvvm_pressed() -> void:
	load_map("res://demo/mvvm.tscn")

func _on_wst_pressed() -> void:
	load_map("res://demo/wst.tscn")

func _on_number_sum_pressed() -> void:
	load_map("res://demo/numbersum_oop.tscn")

func _on_blackbody_pressed() -> void:
	load_map("res://demo/blackbody.tscn")

func _on_tps_pressed() -> void:
	load_map("res://demo/tps.tscn")


func load_map(scene_path: String) -> void:
	get_tree().change_scene_to_file(scene_path)