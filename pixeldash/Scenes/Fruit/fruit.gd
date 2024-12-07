@tool
class_name Fruit
extends Area2D

signal collected(fruit_name:String)

var is_collected := false

@onready var ANIMATED_SPRITE := $AnimatedSprite2D
@export_enum("Kiwi", "Pineapple") var fruit := "Kiwi" : set = set_fruit


func set_fruit(new_value:String) -> void:
	fruit = new_value
	# Since ANIMATED_SPRITE is an onready var, it doesn't become available until just before _ready.
	# Node values are set prior to the scene being ready, so trying to use it would produce Nil errors.
	$AnimatedSprite2D.play(fruit.to_lower())


func _ready() -> void:
	ANIMATED_SPRITE.play(fruit.to_lower())


func _on_body_entered(body: Node2D) -> void:
	if not is_collected and body.has_method("collect_fruit"):
		body.collect_fruit(fruit)
		collected.emit(fruit)
		despawn()


func despawn() -> void:
	is_collected = true
	$AudioStreamPlayer2D.play()
	ANIMATED_SPRITE.play("collected")


func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "collected":
		visible = false
		queue_free()
