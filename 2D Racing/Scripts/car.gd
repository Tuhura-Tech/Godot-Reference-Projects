extends CharacterBody2D


const ACC = 25.0
const MAX = 750.0
const DEC = 5.0
var motion = 0.0

func _physics_process(delta: float) -> void:
	# Add the gravity.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left1", "Right1")
	if direction:
		rotate(2.0 * direction * delta)

	var moving := Input.get_axis("Forward1", "Backward1")
	if moving:
		motion += ACC * moving
		if motion > MAX:
			motion = MAX
		elif motion < -MAX:
			motion = -MAX


	velocity = lerp(motion * transform.y, Vector2.ZERO, 0.2)


	if velocity != Vector2.ZERO:
		if motion > 0:
			motion = max(motion - DEC, -ACC)
		elif motion < 0:
			motion = min(motion + DEC, ACC)

	move_and_slide()
