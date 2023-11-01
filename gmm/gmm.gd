# Godot Miscellaneous Math Libary
class_name GMM extends Object

# Ordinal Numbers
enum {
	FIRST = 0,
	SECOND = 1,
	THIRD = 2,
}


enum {
	INT64_MIN = -2 ** 63,
	INT64_MAX = 2 ** 63 - 1,
	INT64_LEN = 64,

	INT32_MIN = -2 ** 31,
	INT32_MAX = 2 ** 31 - 1,
	INT32_LEN = 32,
	UINT32_MIN = 0,
	UINT32_MAX = 2 ** 32,
	UINT32_LEN = 32,

	INT16_MIN = -2 ** 15,
	INT16_MAX = 2 ** 15 - 1,
	INT16_LEN = 16,
	UINT16_MIN = 0,
	UINT16_MAX = 2 ** 16,
	UINT16_LEN = 16,

	INT8_MIN = -2 ** 7,
	INT8_MAX = 2 ** 7 - 1,
	INT8_LEN = 8,
	UINT8_MIN = 0,
	UINT8_MAX = 2 ** 8,
	UINT8_LEN = 8,
}


enum {
	FALSE = 0,
	TRUE = 1,
	
}


func vec3_from_flt(from: float) -> Vector3:
	return Vector3(from, from, from)


func chash(key: String) -> int:
	var out := 2
	var length := key.length()

	for c in key.to_ascii_buffer():
		out = out * 121 + c + length;

	return out


func crand(rseed: int) -> int:
	return rseed * 0xecc5


func bit_length(num: int) -> int:
	return log(num) / log(2.0) + 1.0 as int


func int_to_bin(num: int) -> String:
	var string := ""
	var val := num

	for i in bit_length(val):
		string = str(val & 1) + string
		val >>= 1

	return string


func chashi(num: int) -> int:
	var rseed := crand(num)
	var out := 2
	var length := bit_length(rseed)

	out = out * 121 + rseed + length;

	return out


func blackbody(temperature: float) -> Color:
	temperature = clampf(temperature, 0.0, 40000.0) / 100.0

	var r := (temperature - 60.0) ** -0.1332047592 * 329.698727446
	var g := (temperature - 60.0) ** -0.0755148492 * 288.1221695283
	var b := 255.0

	if temperature <= 66.0:
		r = 255.0
		g = 99.4708025861 * log(temperature) - 161.1195681661
		b = 0.0 if temperature <= 19.0 else 138.5177312231 * log(temperature - 10.0) - 305.0447927307

	return Color(r / 255.0, minf(g / 255.0, 1.0), b / 255.0)


func xor_vec3(v1: Vector3, v2: Vector3) -> Vector3:
	var ret := Vector3(
		int(v1.x) ^ int(v2.x),
		int(v1.y) ^ int(v2.y),
		int(v1.z) ^ int(v2.z)
	)
	return ret


func linear_lerpf(
	from: float, start: float, end: float, weight: float
) -> float:
	var val_min := minf(start, end)
	var val_max := maxf(start, end)
	var lerped_value := lerpf(start, end, weight)
	
	return clampf(from - (start - lerped_value), val_min, val_max)
