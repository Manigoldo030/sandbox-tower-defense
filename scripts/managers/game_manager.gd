# scripts/managers/game_manager.gd
# オートロード名: GameManager
extends Node

# ── リソース ──────────────────────────────────
var wood:  int = 0
var stone: int = 0
var gold:  int = 0

# ── 拠点 ──────────────────────────────────────
var lives: int = 10

# ── ウェーブ ───────────────────────────────────
var wave: int = 0
var wave_active: bool = false

# ── 仲間 ──────────────────────────────────────
var allies: Array = []

# ── シグナル ───────────────────────────────────
signal resources_changed
signal lives_changed
signal wave_changed
signal game_over

# ── リソース操作 ───────────────────────────────
func add_wood(amount: int = 1):
	wood += amount
	emit_signal("resources_changed")

func add_stone(amount: int = 1):
	stone += amount
	emit_signal("resources_changed")

func add_gold(amount: int = 1):
	gold += amount
	emit_signal("resources_changed")

# 消費（足りなければ false を返す）
func spend_wood(amount: int) -> bool:
	if wood < amount:
		return false
	wood -= amount
	emit_signal("resources_changed")
	return true

func spend_gold(amount: int) -> bool:
	if gold < amount:
		return false
	gold -= amount
	emit_signal("resources_changed")
	return true

# ── 拠点HP操作 ─────────────────────────────────
func lose_life(amount: int = 1):
	lives = max(0, lives - amount)
	emit_signal("lives_changed")
	if lives == 0:
		emit_signal("game_over")

# ── ウェーブ操作 ───────────────────────────────
func start_wave():
	wave += 1
	wave_active = true
	emit_signal("wave_changed")

func end_wave():
	wave_active = false
	emit_signal("wave_changed")

# ── 仲間操作 ───────────────────────────────────
func add_ally(ally_data: Dictionary):
	allies.append(ally_data)

# ── リセット（ゲームオーバー時など） ──────────────
func reset():
	wood  = 0
	stone = 0
	gold  = 0
	lives = 10
	wave  = 0
	wave_active = false
	allies = []
	emit_signal("resources_changed")
	emit_signal("lives_changed")
	emit_signal("wave_changed")
