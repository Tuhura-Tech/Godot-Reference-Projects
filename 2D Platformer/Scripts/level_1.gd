extends Node2D
## Base level 1 script


# Emits when the level is finished
signal level1_finished

const LEVEL2 = preload("res://Scenes/level_2.tscn")

# Emit level1_finished when player finishes the level by reaching the EndArea area
func _on_end_area_body_entered(_body: Node2D) -> void:
	level1_finished.emit()
