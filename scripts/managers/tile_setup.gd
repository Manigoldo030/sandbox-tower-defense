# scripts/managers/tile_setup.gd
# TileMapLayer にアタッチ
extends TileMapLayer

const MAP_W = 40
const MAP_H = 30
const TILE_SIZE = 16
const TREE_COUNT = 15

func _ready():
	_apply_texture()
	_generate_map()
	_place_trees()

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
	position = Vector2(-MAP_W * TILE_SIZE / 2.0, -MAP_H * TILE_SIZE / 2.0)
	for y in range(MAP_H):
		for x in range(MAP_W):
			set_cell(Vector2i(x, y), 0, Vector2i(0, 0))

func _place_trees():
	var tree_scene = load("res://scenes/tree.tscn")
	if tree_scene == null:
		return
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	for i in range(TREE_COUNT):
		var tx = rng.randi_range(2, MAP_W - 3)
		var ty = rng.randi_range(2, MAP_H - 3)
		var world_pos = position + Vector2(tx * TILE_SIZE + TILE_SIZE / 2.0, ty * TILE_SIZE + TILE_SIZE / 2.0)
		var tree = tree_scene.instantiate()
		get_parent().add_child.call_deferred(tree)
		tree.global_position = world_pos
