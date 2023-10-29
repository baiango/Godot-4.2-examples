extends Object
class_name ViewModel
# ViewModel is responsible for managing and filtering out the data


var model: Model

func _init(new_model: Model):
	model = new_model

func get_img_path(index: int) -> String:
	return model.get_data()[index]

func get_num_of_path() -> int:
	return model.get_data().size()
