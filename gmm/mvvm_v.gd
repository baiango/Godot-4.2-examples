extends Sprite2D
class_name View
# View is responsible for showing the image


var gvm := preload("gmm.gd").new()

var model := preload("mvvm_m.gd").new()
var view_model := preload("mvvm_vm.gd").new(model)


var img_index := gvm.FIRST as int


func _ready() -> void:
	render(view_model, gvm.FIRST as int)


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		img_index = clampi(
			img_index + Input.get_axis("ui_left", "ui_right") as int,
			gvm.FIRST as int,
			view_model.get_num_of_path() - 1
		)
		render(view_model, img_index)


func _on_left_pressed() -> void:
	img_index = maxi(gvm.FIRST as int, img_index - 1)
	render(view_model, img_index)


func _on_right_pressed() -> void:
	img_index = mini(view_model.get_num_of_path() - 1, img_index + 1)
	render(view_model, img_index)


func render(img_view_model: ViewModel, index: int) -> void:
	texture = load(img_view_model.get_img_path(index))
