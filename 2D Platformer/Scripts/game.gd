extends Node2D
## Level loader


# Load the first level as soon as the game is run to save time later
const LEVEL_1 = preload("res://Scenes/level_1.tscn")


# Load the first level
func _ready() -> void:
	var level_1 = LEVEL_1.instantiate()
	level_1.connect("level1_finished", _on_level1_finished)
	add_child(level_1)


# Quit all levels when the first level is finished
func _on_level1_finished():
	for child in get_children():
		child.queue_free()
