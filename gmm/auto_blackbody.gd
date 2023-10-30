@tool extends OmniLight3D


var gmm := GMM.new()
@export var temperature := 1000


func _process(_delta: float):
	set_color(gmm.blackbody(temperature))
