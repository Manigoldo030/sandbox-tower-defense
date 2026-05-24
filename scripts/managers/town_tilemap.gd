# scripts/managers/town_tilemap.gd
# town.tscn の TileMapLayer にアタッチする
extends TileMapLayer

const MAP_W = 30
const MAP_H = 22
const TILE_SIZE = 16

func _ready():
	_apply_texture()
	_generate_map()

func _apply_texture():
	var ts = get_tile_set()
	if ts == null:
		return
	var source = ts.get_source(ts.get_source_id(0))
	if source is TileSetAtlasSource:
		source.texture = SpriteGen.make_tile_atlas()
		source.texture_region_size = Vector2i(TILE_SIZE, TILE_SIZE)

func _generate_map():
	clear()
	var offset_x = float(-MAP_W * TILE_SIZE) / 2.0
	var offset_y = float(-MAP_H * TILE_SIZE) / 2.0
	position = Vector2(offset_x, offset_y)

	for y in range(MAP_H):
		for x in range(MAP_W):
			if x == 0 or x == MAP_W - 1 or y == 0 or y == MAP_H - 1:
				set_cell(Vector2i(x, y), 0, Vector2i(2, 0))
			else:
				set_cell(Vector2i(x, y), 0, Vector2i(1, 0))

	# 出口（下の壁中央を草タイルにして出口を示す）
	var mid: int = MAP_W / 2
	set_cell(Vector2i(mid - 1, MAP_H - 1), 0, Vector2i(0, 0))
	set_cell(Vector2i(mid,     MAP_H - 1), 0, Vector2i(0, 0))
	set_cell(Vector2i(mid + 1, MAP_H - 1), 0, Vector2i(0, 0))
