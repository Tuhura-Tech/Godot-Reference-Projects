extends Node2D

@export var to_load : PackedScene

@onready var levelHolder : Node2D = $"../../../levelHolder"
@onready var player : CharacterBody2D = $"../../../player"

func _on_area_2d_body_entered(body):
	if(body.is_in_group("player")):
		levelHolder.get_child(0).queue_free()
		var loaded = to_load.instantiate()
		levelHolder.call_deferred("add_child",loaded)
		player.global_position = loaded.get_node("player_spawn").position
