extends Node2D


func _ready() -> void:
	connect("draw", _on_draw)


func _on_draw() -> void:
	var arrowhead_points := PackedVector2Array([
		Vector2(0.0, 0.0), Vector2(3.0, 0.0), Vector2(3.0, 1.0),
		
	])
	var arrowhead_color := PackedColorArray()

	for i in arrowhead_points.size():
		arrowhead_color.append(Color(1.0, 0.0, 0.0))

	draw_polygon(arrowhead_points, arrowhead_color)
