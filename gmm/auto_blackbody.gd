@tool extends OmniLight3D


var gvm := preload("gmm.gd").new()
@export var temperature := 1000


func _process(_delta: float):
	set_color(gvm.blackbody(temperature))
