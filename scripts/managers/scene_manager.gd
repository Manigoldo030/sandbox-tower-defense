# scripts/managers/scene_manager.gd
# オートロード名: SceneManager
extends Node

const SCENES = {
	"town":  "res://scenes/town/town.tscn",
	"field": "res://scenes/field/field.tscn",
	"base":  "res://scenes/base/base.tscn",
}

var current_scene: String = "town"

func go_to(scene_name: String):
	if not SCENES.has(scene_name):
		push_error("SceneManager: 不明なシーン名 -> " + scene_name)
		return
	current_scene = scene_name
	get_tree().change_scene_to_file.call_deferred(SCENES[scene_name])

func go_to_town():  go_to("town")
func go_to_field(): go_to("field")
func go_to_base():  go_to("base")
