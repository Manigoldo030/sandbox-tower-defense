extends CharacterBody2D

const SPEED = 200.0
var wood_count = 0

func _ready():
	update_ui()

func _physics_process(_delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	velocity = direction.normalized() * SPEED
	move_and_slide()

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		var trees = get_tree().get_nodes_in_group("trees")
		for tree in trees:
			var dist = global_position.distance_to(tree.global_position)
			if dist < 300:
				wood_count += 1
				tree.queue_free()
				update_ui()

func update_ui():
	var label = get_node("../CanvasLayer/Label")
	label.text = "木: " + str(wood_count) + " 個"
