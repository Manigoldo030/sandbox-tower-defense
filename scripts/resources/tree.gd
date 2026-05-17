extends Area2D

func _ready():
	$Sprite2D.texture = load("res://assets/icon.svg")
	$CollisionShape2D.shape = CircleShape2D.new()
	$CollisionShape2D.shape.radius = 64
	add_to_group("trees")
