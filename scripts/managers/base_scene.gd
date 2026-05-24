extends Node2D

@onready var wave_button = $CanvasLayer/Button

func _ready():
	wave_button.pressed.connect(_on_wave_button_pressed)

func _on_wave_button_pressed():
	GameManager.start_wave()
	wave_button.visible = false
	print("ウェーブ ", GameManager.wave, " 開始！")
