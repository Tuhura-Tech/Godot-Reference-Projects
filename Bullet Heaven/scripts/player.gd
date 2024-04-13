extends CharacterBody2D
class_name Player


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var health_bar = $HealthBar


func _ready():
	Singleton.player_node = self


func _physics_process(_delta):
	health_bar.value = Singleton.player_health
	
	var x_direction = Input.get_axis("left", "right")
	var y_direction = Input.get_axis("up", "down")
	
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()
