# scripts/managers/sprite_generator.gd
# オートロード名: SpriteGen
extends Node

func make_tile_atlas() -> ImageTexture:
	var img = Image.create(48, 16, false, Image.FORMAT_RGBA8)
	# 草(0,0)
	_fill(img, Rect2i(0,0,16,16), Color(0.35,0.62,0.22))
	_fill(img, Rect2i(0,0,16,2),  Color(0.45,0.75,0.30))
	_fill(img, Rect2i(0,0,2,16),  Color(0.45,0.75,0.30))
	_fill(img, Rect2i(0,14,16,2), Color(0.22,0.45,0.12))
	_fill(img, Rect2i(14,0,2,16), Color(0.22,0.45,0.12))
	# 土(1,0)
	_fill(img, Rect2i(16,0,16,16), Color(0.58,0.38,0.18))
	_fill(img, Rect2i(16,0,16,2),  Color(0.70,0.50,0.26))
	_fill(img, Rect2i(16,0,2,16),  Color(0.70,0.50,0.26))
	_fill(img, Rect2i(16,14,16,2), Color(0.38,0.22,0.08))
	_fill(img, Rect2i(30,0,2,16),  Color(0.38,0.22,0.08))
	_fill(img, Rect2i(20,5,3,2),   Color(0.48,0.28,0.12))
	_fill(img, Rect2i(26,9,3,2),   Color(0.48,0.28,0.12))
	# 岩(2,0)
	_fill(img, Rect2i(32,0,16,16), Color(0.50,0.50,0.52))
	_fill(img, Rect2i(32,0,16,2),  Color(0.65,0.65,0.68))
	_fill(img, Rect2i(32,0,2,16),  Color(0.65,0.65,0.68))
	_fill(img, Rect2i(32,14,16,2), Color(0.30,0.30,0.32))
	_fill(img, Rect2i(46,0,2,16),  Color(0.30,0.30,0.32))
	return ImageTexture.create_from_image(img)

func make_tree() -> ImageTexture:
	var img = Image.create(64, 64, false, Image.FORMAT_RGBA8)
	img.fill(Color(0,0,0,0))
	_fill(img, Rect2i(26,42,12,20), Color(0.50,0.30,0.10))
	_fill(img, Rect2i(28,43,4,18),  Color(0.62,0.40,0.18))
	_circle(img, Vector2i(32,26), 20, Color(0.18,0.55,0.18))
	_circle(img, Vector2i(32,24), 17, Color(0.26,0.68,0.22))
	_circle(img, Vector2i(30,22), 11, Color(0.34,0.78,0.28))
	return ImageTexture.create_from_image(img)

func make_player() -> ImageTexture:
	var img = Image.create(64, 64, false, Image.FORMAT_RGBA8)
	img.fill(Color(0,0,0,0))
	_fill(img, Rect2i(18,46,10,16), Color(0.15,0.25,0.60))
	_fill(img, Rect2i(36,46,10,16), Color(0.15,0.25,0.60))
	_fill(img, Rect2i(15,28,34,20), Color(0.22,0.48,0.85))
	_fill(img, Rect2i(17,30,8,15),  Color(0.38,0.60,0.95))
	_fill(img, Rect2i(5,28,10,18),  Color(0.22,0.48,0.85))
	_fill(img, Rect2i(49,28,10,18), Color(0.22,0.48,0.85))
	_circle(img, Vector2i(32,16), 13, Color(0.95,0.78,0.60))
	_circle(img, Vector2i(27,14), 2,  Color(0.10,0.10,0.10))
	_circle(img, Vector2i(37,14), 2,  Color(0.10,0.10,0.10))
	_fill(img, Rect2i(28,20,8,2),   Color(0.70,0.30,0.25))
	return ImageTexture.create_from_image(img)

func make_tower() -> ImageTexture:
	var img = Image.create(64, 64, false, Image.FORMAT_RGBA8)
	img.fill(Color(0,0,0,0))
	# 土台
	_fill(img, Rect2i(8,40,48,22),  Color(0.40,0.40,0.45))
	_fill(img, Rect2i(8,40,48,3),   Color(0.60,0.60,0.65))
	# 塔
	_fill(img, Rect2i(18,12,28,30), Color(0.50,0.50,0.55))
	_fill(img, Rect2i(18,12,28,4),  Color(0.70,0.70,0.75))
	# 銃身
	_fill(img, Rect2i(44,24,16,6),  Color(0.30,0.30,0.35))
	# 窓
	_fill(img, Rect2i(24,20,8,8),   Color(0.20,0.40,0.80))
	return ImageTexture.create_from_image(img)

func make_enemy() -> ImageTexture:
	var img = Image.create(48, 48, false, Image.FORMAT_RGBA8)
	img.fill(Color(0,0,0,0))
	# 体
	_circle(img, Vector2i(24,28), 16, Color(0.80,0.15,0.15))
	_circle(img, Vector2i(24,28), 13, Color(0.95,0.25,0.25))
	# 目
	_circle(img, Vector2i(18,24), 4, Color(0.10,0.10,0.10))
	_circle(img, Vector2i(30,24), 4, Color(0.10,0.10,0.10))
	_circle(img, Vector2i(19,23), 2, Color(1.0,1.0,1.0))
	_circle(img, Vector2i(31,23), 2, Color(1.0,1.0,1.0))
	# 口
	_fill(img, Rect2i(17,33,14,3),  Color(0.60,0.05,0.05))
	# 角
	_fill(img, Rect2i(14,10,6,10),  Color(0.60,0.10,0.10))
	_fill(img, Rect2i(28,10,6,10),  Color(0.60,0.10,0.10))
	return ImageTexture.create_from_image(img)

func make_bullet() -> ImageTexture:
	var img = Image.create(12, 12, false, Image.FORMAT_RGBA8)
	img.fill(Color(0,0,0,0))
	_circle(img, Vector2i(6,6), 5, Color(1.0,0.85,0.10))
	_circle(img, Vector2i(6,6), 3, Color(1.0,1.0,0.60))
	return ImageTexture.create_from_image(img)

func _fill(img: Image, rect: Rect2i, color: Color) -> void:
	for y in range(rect.position.y, rect.position.y + rect.size.y):
		for x in range(rect.position.x, rect.position.x + rect.size.x):
			if x >= 0 and x < img.get_width() and y >= 0 and y < img.get_height():
				img.set_pixel(x, y, color)

func _circle(img: Image, center: Vector2i, radius: int, color: Color) -> void:
	for y in range(center.y - radius, center.y + radius + 1):
		for x in range(center.x - radius, center.x + radius + 1):
			if (x-center.x)*(x-center.x)+(y-center.y)*(y-center.y) <= radius*radius:
				if x >= 0 and x < img.get_width() and y >= 0 and y < img.get_height():
					img.set_pixel(x, y, color)
