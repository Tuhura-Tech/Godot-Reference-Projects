extends Node2D


const LEVEL2 = preload("res://Scenes/level_2.tscn")

func _on_level_change_body_entered(body:Node2D) -> void:
	get_tree().change_scene_to_packed(LEVEL2)
