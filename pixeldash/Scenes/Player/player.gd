extends CharacterBody2D

const BASE_MOVE_SPEED := 750

func _physics_process(delta: float) -> void:
	# read Input action strengths to easily get the horizontal and vertical input
	var input_vector := Input.get_vector("left", "right", "up", "down")
	
	# The input vector returns 0 for "not pressed" and 1 for "pressed", so multiply by move speed.
	velocity = input_vector * BASE_MOVE_SPEED
	
	# Moves the body based on velocity. If the body collides with another, it will slide along the
	# other body (by default only on floor) rather than stop immediately. If the other body is a
	# CharacterBody2D or RigidBody2D, it will also be affected by the motion of the other body. You
	# can use this to make moving and rotating platforms, or to make nodes push other nodes.
	move_and_slide()
	
	# If this node's X velocity is negative, we're moving left and should flip the sprite.
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	
	# A negative y velocity means this node is moving UP, so we play the jump animation.
	if velocity.y < 0:
		$AnimatedSprite2D.play("jump")
	elif velocity.y > 0:
		$AnimatedSprite2D.play("fall")
	elif velocity.x != 0:
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")
