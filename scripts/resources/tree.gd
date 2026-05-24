# scripts/resources/tree.gd
extends Area2D

func _ready():
	$Sprite2D.texture = SpriteGen.make_tree()
	$Sprite2D.scale = Vector2(1.0, 1.0)
	add_to_group("trees")
