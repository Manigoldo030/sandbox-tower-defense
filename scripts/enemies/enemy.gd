# scripts/enemies/enemy.gd
extends CharacterBody2D

const SPEED = 40.0

var hp: int = 30
var _goal: Vector2 = Vector2.ZERO

func _ready():
	$Sprite2D.texture = SpriteGen.make_enemy()
	$Sprite2D.scale = Vector2(0.8, 0.8)
	add_to_group("enemies")
	# ゴール（マップ中央）に向かう
	_goal = Vector2.ZERO

func _physics_process(_delta):
	var dir = (_goal - global_position).normalized()
	velocity = dir * SPEED
	move_and_slide()
	if global_position.distance_to(_goal) < 16.0:
		GameManager.lose_life()
		queue_free()

func take_damage(amount: int):
	hp -= amount
	if hp <= 0:
		queue_free()
