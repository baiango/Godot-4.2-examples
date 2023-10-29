extends Node


# The most straightforward way of programming
func _ready() -> void:
	var sum := 0

	for i in 10:
		sum += i
	
	print_debug("Sum using PP: ", sum)
