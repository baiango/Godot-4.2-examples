extends Node


# Note that it only modifies the variables once (Immutability)
# The functions are self-contained (Pure function)
func _ready() -> void:
	var numbers := PackedInt32Array()
	numbers.resize(10)
	# start + i
	iota(numbers, 0, numbers.size(), 0)

	# sum += array[i]
	var sum := accumulate(numbers, 0, numbers.size(), 0)
	
	print_debug("Sum using FP: ", sum)


func iota(
	array: PackedInt32Array,
	begin: int, end: int, start: int
) -> PackedInt32Array:
	for i in end - begin:
		array[i] = start + i

	return array

func accumulate(
	array: PackedInt32Array,
	begin: int, end: int, initial: int
) -> int:
	var sum := initial
	for i in end - begin:
		sum += array[i]

	return sum
