# scripts/player/character_body_2d.gd
extends CharacterBody2D

const SPEED = 120.0
const CHOP_RANGE = 40.0  # タイル約2.5枚分

func _ready():
	$Sprite2D.texture = SpriteGen.make_player()
	$Sprite2D.scale = Vector2(0.85, 0.85)
	# GameManager のシグナルで UI を更新
	GameManager.resources_changed.connect(_update_ui)
	GameManager.lives_changed.connect(_update_ui)
	GameManager.wave_changed.connect(_update_ui)
	_update_ui()

func _physics_process(_delta):
	var dir = Vector2.ZERO
	if Input.is_action_pressed("ui_right"): dir.x += 1
	if Input.is_action_pressed("ui_left"):  dir.x -= 1
	if Input.is_action_pressed("ui_down"):  dir.y += 1
	if Input.is_action_pressed("ui_up"):    dir.y -= 1
	if dir.x != 0:
		$Sprite2D.flip_h = dir.x < 0
	velocity = dir.normalized() * SPEED
	move_and_slide()

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		_chop_nearby_trees()

func _chop_nearby_trees():
	var chopped = false
	for tree in get_tree().get_nodes_in_group("trees"):
		if global_position.distance_to(tree.global_position) < CHOP_RANGE:
			GameManager.add_wood(1)
			tree.queue_free()
			chopped = true
	if not chopped:
		# 近くに木がなかった場合、何もしない（将来的にSEを鳴らすなど）
		pass

func _update_ui():
	var label = get_node_or_null("../CanvasLayer/Label")
	if label:
		label.text = "木材: %d  石: %d  金: %d  ライフ: %d  Wave: %d" % [
			GameManager.wood,
			GameManager.stone,
			GameManager.gold,
			GameManager.lives,
			GameManager.wave
		]
