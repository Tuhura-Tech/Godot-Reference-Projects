extends Node

const MAIN = preload("res://scenes/main.tscn")

var player_health: int = 100

@onready var player_node: Player


func _physics_process(_delta):
	if player_health <= 0:
		player_health = 100
		get_tree().reload_current_scene()
