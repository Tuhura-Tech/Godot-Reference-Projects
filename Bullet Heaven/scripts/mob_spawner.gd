extends Path2D
## Spawns mobs around the edge of the screen


# Loads in the enemy scene as soon as the game is run to spawn it efficiently
const ENEMY = preload("res://scenes/enemy.tscn")

# Export variables
@export_range(0.0, 1.0, 0.01) var respawn_delta: float = 0.99

# Variables
var main_node: Node2D

# Onready variables
@onready var spawn_location = $SpawnLocation
@onready var spawn_timer = $SpawnTimer


# Run as soon as the game starts
func _ready():
	# Get the main node to add the new enemies as a child of
	main_node = get_node("/root/Main")


# When the spawn timer Timer has run out, run this (see spawn timer node in scene tree)
func _on_spawn_timer_timeout():
	var new_enemy: Enemy = ENEMY.instantiate() # Create a new enemy from the scene
	spawn_location.progress_ratio = randf() # Randomize where it spawns around the edge of the screen 
	new_enemy.global_position  = spawn_location.global_position # Set its position there
	main_node.add_child(new_enemy) # Finally add the enemy to the scene
	
	spawn_timer.wait_time *= respawn_delta # Decrease how long it takes for the next enemy to spawn
