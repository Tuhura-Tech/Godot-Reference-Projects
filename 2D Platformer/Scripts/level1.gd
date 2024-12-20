extends Node2D
## Base level 1 script


const LEVEL2 = preload("res://Scenes/level2.tscn")

# Change to next level when player finishes the level by reaching the EndArea area
func _on_end_area_body_entered(_body: Node2D) -> void:
	get_tree().change_scene_to_packed(LEVEL2)
