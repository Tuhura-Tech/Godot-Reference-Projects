extends CharacterBody2D
## Slime class, the enemy of the game
## Bounces off walls


# Constants
const SPEED = 30.0

# Variables
var direction = -1

# In-scene nodes
@onready var sprite = $AnimatedSprite
@onready var raycast_left = $RayCastLeft
@onready var raycast_right = $RayCastRight


# Update the slime's movement
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Change direction
	if raycast_left.is_colliding():
		direction = 1
	elif raycast_right.is_colliding():
		direction = -1
	
	# Set and apply velocity
	velocity.x = direction * SPEED
	move_and_slide()


# Update how the slime looks
func _process(_delta: float) -> void:
	if direction > 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
