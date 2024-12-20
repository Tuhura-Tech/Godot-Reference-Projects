extends CharacterBody2D


const SPEED = 30.0

var direction = -1

@onready var sprite = $AnimatedSprite2D
@onready var raycast_left = $RayCastLeft
@onready var raycast_right = $RayCastRight


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	
	if raycast_left.is_colliding():
		direction = 1
	elif raycast_right.is_colliding():
		direction = -1
	
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true
	
	velocity.x = direction * SPEED
	
	move_and_slide()
