extends CharacterBody2D

@onready var sprite_node = $AnimatedSprite2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if velocity.x > 0:
		sprite_node.flip_h = false
	elif velocity.x < 0:
		sprite_node.flip_h = true
	if abs(velocity.x) > 0:
		sprite_node.animation = "run"
	else:
		sprite_node.animation = "idle"

	move_and_slide()
