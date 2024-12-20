extends CharacterBody2D
## Class for the player, controlled by the user


# Constants
const SPEED = 150.0
const JUMP_VELOCITY = -300.0

# In-scene nodes
@onready var sprite_node = $AnimatedSprite


# Runs consistently as much as possible, for physics
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# Move the player
	move_and_slide()


# Runs every frame, for anything non-physics like visual things
func _process(_delta: float) -> void:
	if velocity.x > 0:
		sprite_node.flip_h = false
	elif velocity.x < 0:
		sprite_node.flip_h = true
	if abs(velocity.x) > 0:
		sprite_node.animation = "run"
	else:
		sprite_node.animation = "idle"
