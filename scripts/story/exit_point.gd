# scripts/story/exit_point.gd
extends Area2D

@export var destination: String = "field"
@export var label_text: String = "→ フィールドへ"

func _ready():
	var shape = RectangleShape2D.new()
	shape.size = Vector2(48, 16)
	$CollisionShape2D.shape = shape
	body_entered.connect(_on_body_entered)
	_make_sign()

func _make_sign():
	# 矢印看板を図形で描く
	var sign_node = Node2D.new()
	add_child(sign_node)

	# 看板の背景（茶色い板）
	var board = ColorRect.new()
	board.color = Color(0.55, 0.35, 0.10)
	board.size = Vector2(80, 20)
	board.position = Vector2(-40, -28)
	sign_node.add_child(board)

	# 看板の文字
	var lbl = Label.new()
	lbl.text = label_text
	lbl.add_theme_font_size_override("font_size", 10)
	lbl.add_theme_color_override("font_color", Color(1, 1, 0.8))
	lbl.position = Vector2(-38, -27)
	sign_node.add_child(lbl)

	# 光るエフェクト（緑の床タイル風）
	var glow = ColorRect.new()
	glow.color = Color(0.30, 0.80, 0.30, 0.5)
	glow.size = Vector2(48, 16)
	glow.position = Vector2(-24, -8)
	sign_node.add_child(glow)

func _on_body_entered(body):
	if body is CharacterBody2D:
		SceneManager.go_to(destination)
