#@tool # Disabled, because it save the texture data, which take up space.
extends MeshInstance3D
class_name NoiseAlbedo
# Write "extends NoiseAlbedo" to use it on MeshInstance3D
# Color palette
# 35155d Russian Violet
# 512b81 Regalia
# 4477ce Han Blue
# 8cabff Jordy Blue


func _ready():
	var mat := get_mesh().surface_get_material(0) as StandardMaterial3D
	if not mat:
		return

	var pixel := PackedByteArray()
	pixel.resize(128 * 128)

	var gmm := GMM.new()
	var name_hash := hash(name)

	for i in 128 * 128:
		var col := hash(gmm.crand(i * name_hash)) >> (gmm.UINT32_LEN - gmm.UINT8_LEN)

		pixel[i] = remap(col, 0.0, 255.0, 200.0, 255.0) as int

	var asset := Image.new()
	asset.set_data(128, 128, false, Image.FORMAT_L8, pixel)

	var img := ImageTexture.create_from_image(asset)
	mat.set_texture(mat.TextureParam.TEXTURE_ALBEDO, img)
	mat.set_texture_filter(mat.TextureFilter.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS)
