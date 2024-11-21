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
