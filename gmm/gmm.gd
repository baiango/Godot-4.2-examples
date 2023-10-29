# Godot Miscellaneous Math
extends Object

# Ordinal Numbers
enum {
	FIRST,
	SECOND,
	THIRD,
	FOURTH,
	FIFTH,
	SIXTH,
	SEVENTH,
	EIGHTH,
	NINTH,
	TENTH,
	ELEVENTH,
	TWELFTH,
	THIRTEENTH,
	FOURTEENTH,
	FIFTEENTH,
	SIXTEENTH,
	SEVENTEENTH,
	EIGHTEENTH,
	NINETEENTH,
	TWENTIETH
}


func vec3_from_flt(from: float) -> Vector3:
	return Vector3(from, from, from)


func chash(key: String) -> int:
	var out := 2
	var length := key.length()

	for c in key.to_ascii_buffer():
		out = out * 121 + c + length;

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
