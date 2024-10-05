extends Node2D

var level1 = preload("res://Scenes/level_1.tscn")

func _ready() -> void:
	var l = level1.instantiate()
	l.connect("level1_finished", _on_level1_finished)
	add_child(l)

func _on_level1_finished():
	for n in get_children():
		remove_child(n)
		n.queue_free()
