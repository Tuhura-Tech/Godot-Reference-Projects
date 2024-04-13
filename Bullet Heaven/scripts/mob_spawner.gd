extends Path2D

@export_range(0.0, 1.0, 0.01) var respawn_delta: float = 0.99

const ENEMY = preload("res://scenes/enemy.tscn")

@onready var spawn_location = $SpawnLocation
@onready var spawn_timer = $SpawnTimer

var main_node: Node2D

func _ready():
	main_node = get_node("/root/Main")

func _on_spawn_timer_timeout():
	var new_enemy: Enemy = ENEMY.instantiate()
	spawn_location.progress_ratio = randf()
	new_enemy.global_position  = spawn_location.global_position
	main_node.add_child(new_enemy)
	
	spawn_timer.wait_time *= respawn_delta
