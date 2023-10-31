extends Line2D
# Deprecated


var tween: Tween
@export var pen: Node2D
var viewport_size: Vector2


func _ready() -> void:
	pen = $Pen
	pen.set_position(Vector2(250.0, 250.0))


func _process(delta: float) -> void:
	update_var()

	tween = create_tween()
	tween.tween_property(pen, "position:x", viewport_size.x * 0.95, 2.0)
	#pen.position.x += delta * 60.0 * 10.0
	add_point(pen.get_position())

	if get_points()[-1].x > viewport_size.x * 0.95:
		clear()


func update_var() -> void:
	viewport_size = get_viewport().get_size()


func clear() -> void:
	clear_points()
	pen.position.x = viewport_size.x * 0.05

