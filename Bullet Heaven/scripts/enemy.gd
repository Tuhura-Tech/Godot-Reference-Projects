extends CharacterBody2D
class_name Enemy


const SPEED = 100.0
const DAMAGE = 5

func _physics_process(_delta):
	
	if Singleton.player_node is Player:
		velocity = global_position.direction_to(Singleton.player_node.global_position) * SPEED
	else:
		print(Singleton.player_node)
	
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() is Player:
			Singleton.player_health -= DAMAGE
			queue_free()

