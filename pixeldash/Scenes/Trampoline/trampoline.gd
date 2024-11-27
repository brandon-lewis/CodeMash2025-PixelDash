extends Node2D

@export var bounce_strength := 500

func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body is CharacterBody2D:
		body.velocity.y = -bounce_strength
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.play("jump")
		$AudioStreamPlayer2D.play()


func _on_animated_sprite_2d_animation_finished() -> void:
	$AnimatedSprite2D.play("idle")
