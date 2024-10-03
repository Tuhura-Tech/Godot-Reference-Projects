extends CharacterBody2D

@export var speed = 200
@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * speed 
	
	if velocity != Vector2.ZERO:
		animated_sprite_2d.play("walk")
	else:
		animated_sprite_2d.play("idle")
	
	#May seem strange, but I want the flip to maintain if the player is going directly up or down
	if(velocity.x < 0):
		animated_sprite_2d.flip_h = true
	elif(velocity.x > 0):
		animated_sprite_2d.flip_h = false

	move_and_slide()
