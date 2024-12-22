extends Area2D
## Kill area, reloads the game


# Restart the game when the engine is free to do so
func _on_body_entered(body:Node2D):
	get_tree().call_deferred("reload_current_scene")
