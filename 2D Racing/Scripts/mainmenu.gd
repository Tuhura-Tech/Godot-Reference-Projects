extends Control


const TRACK_SELECT = preload("res://Scenes/track_select.tscn")

func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(TRACK_SELECT)


func _on_exit_pressed() -> void:
	get_tree().quit()
