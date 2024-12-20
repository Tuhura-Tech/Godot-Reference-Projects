class_name Player
extends CharacterBody2D
## Player class, controlled by the player


# Constant values
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Variables
var health: int = 100

# In-scene nodes
@onready var health_bar = $HealthBar


# Runs as soon as the player exists
func _enter_tree() -> void:
	Singleton.player_node = self


# Runs 60 times a second if it can, it will be consistent when it's run. Delta has an _ because we don't use it, move_and_slide uses it internally already
func _physics_process(_delta) -> void:
	# Get the input direction as a Vector2, ctrl/cmd + click on get_vector to see its definition. Normalized() makes it equal in all directions; won't be more in diagonal directions
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down").normalized()
	
	# Set the player's velocity according to how the direction of input
	velocity.x = direction.x * SPEED
	velocity.y = direction.y * SPEED
	
	# Takes the velocity and moves the player
	move_and_slide()


# Runs as fast as possible, as soon as the screen updates
func _process(_delta: float) -> void:
	# Update the health bar, it's here and not in _physics_process because it's visual
	health_bar.value = health
