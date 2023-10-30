extends Label


var keymap := {
	"A": {"name": "Move", "next": {
		"Z": {"name": "X axis", "next": {}},
		"S": {"name": "Y axis", "next": {}},
		"C": {"name": "Z axis", "next": {}},
	}},
	"S": {"name": "Scale", "next": {
		"Z": {"name": "X axis", "next": {}},
		"S": {"name": "Y axis", "next": {}},
		"C": {"name": "Z axis", "next": {}},
	}},
	"D": {"name": "Rotate", "next": {
		"Z": {"name": "X axis", "next": {}},
		"S": {"name": "Y axis", "next": {}},
		"C": {"name": "Z axis", "next": {}},
	}},
	"RMB": {"name": "Fly", "next": {
		"Release RMB": {"name": "Exit fly mode", "next": {}},
		"Shift": {"name": "Fly faster", "next": {}},
		"W": {"name": "Move Front", "next": {}},
		"A": {"name": "Move Left", "next": {}},
		"S": {"name": "Move Back", "next": {}},
		"D": {"name": "Move Right", "next": {}},
		"Q": {"name": "Move Down", "next": {}},
		"E": {"name": "Move Up", "next": {}},
	}},
}


func _process(_delta: float) -> void:
	set_text(cleanse_dictionary_to_string(keymap))
	if Input.is_action_pressed("rmb"):
		set_text(cleanse_dictionary_to_string(keymap["RMB"]["next"]))


func cleanse_dictionary_to_string(dict: Dictionary) -> String:
	return cutoff(str(first_layer_only(dict)), 1, -1).replace("\"", "").replace(",", " | ")


func first_layer_only(dict: Dictionary) -> Dictionary:
	var ret := {}
	for key in dict.keys():
		ret[key] = dict[key]["name"]

	return ret


func cutoff(txt: String, begin: int, end: int) -> String:
	return txt.substr(begin, txt.length() + end - begin)
