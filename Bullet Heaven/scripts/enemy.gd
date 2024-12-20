class_name Enemy
extends CharacterBody2D
## Class for the sole enemy type of the game


# Constants
const SPEED = 100.0
const DAMAGE = 5


# Runs 60 times a second if it can, it will be consistent when it's run. Delta has an _ because we don't use it
func _physics_process(_delta):
	# Check if the player exists (if the scene has reloaded this may not be the case
	if Singleton.player_node is Player:
		# Set velocity to move toward the player
		velocity = global_position.direction_to(Singleton.player_node.global_position) * SPEED
	else:
		print(Singleton.player_node)
	
	# Move the enemy
	move_and_slide()
	
	# If touches the player, damage the player and end itself
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() is Player:
			Singleton.player_health -= DAMAGE
			queue_free()
