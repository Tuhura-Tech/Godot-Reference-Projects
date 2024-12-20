extends Area2D
## Coin that can be picked up, only prints +1 coin


## Print +1 coin and free self
func _on_body_entered(_body: Node2D) -> void:
	print("+1 coin")
	queue_free()
