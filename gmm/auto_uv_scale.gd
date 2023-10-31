@tool extends MeshInstance3D


var gmm := GMM.new()
@export var tex_width := 2.0 # in meter


func _ready() -> void:
	if not mesh.surface_get_material(gmm.FIRST):
		return

	set_uv_scale()
	map_texture_to_world_space()


func set_uv_scale() -> void:
	mesh.material.uv1_scale = gmm.vec3_from_flt(1.0 / 2.0 / tex_width)

func map_texture_to_world_space() -> void:
	mesh.material.uv1_triplanar = true
