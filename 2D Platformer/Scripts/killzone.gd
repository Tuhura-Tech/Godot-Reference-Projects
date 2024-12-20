extends Area2D


@onready var timer = $Timer


func _on_body_entered(body:Node2D):
	get_tree().call_deferred("reload_current_scene")
