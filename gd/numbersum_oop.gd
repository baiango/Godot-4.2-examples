extends Node


# You use classes like you do with variables
# But only use methods (functions that are inside a class)
# to modify the state
class NumberSum:
	var __sum__ := 0
	
	func add_number(num: int) -> void:
		__sum__ += num
	
	func get_sum() -> int:
		return __sum__


func _ready() -> void:
	var sum_calculator := NumberSum.new()
	
	for i in 10:
		sum_calculator.add_number(i)

	print_debug("Sum using OOP: ", sum_calculator.get_sum())
