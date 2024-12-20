extends Node
## The singleton called "Singleton"
## Can be accessed anywhere at any time by using Singleton.<parameter/method here>


# Loads in the main scene as soon as the game is run
const MAIN = preload("res://scenes/main.tscn")

@onready var player_node: Player


# Runs 60 times a second if it can, it will be consistent when it's run. Delta has an _ because we don't use it
func _physics_process(_delta):
	# If the player dies, restart the game
	if player_node.health <= 0:
		player_node.health = 100
		get_tree().reload_current_scene()
