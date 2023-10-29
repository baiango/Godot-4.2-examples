extends Object
class_name Model
# Model is responsible for storing the data


const img_paths: PackedStringArray = [
	"res://global_asset/kira.png",
	"res://global_asset/alice.png",
	"res://global_asset/alice 2.png",
]

func get_data() -> PackedStringArray:
	return img_paths
