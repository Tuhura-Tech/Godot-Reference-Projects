extends Node2D

signal level1_finished


func _on_area_2d_body_entered(body:Node2D) -> void:
	level1_finished.emit()
