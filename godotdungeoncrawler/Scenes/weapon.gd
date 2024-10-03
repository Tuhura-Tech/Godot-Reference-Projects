extends Node2D

@onready var animation_player = $AnimationPlayer

func _process(delta):
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("Attack"):
		animation_player.play("Attack")
