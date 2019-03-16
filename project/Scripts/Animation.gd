extends AnimatedSprite

func update_animatedSprite(movement):
	# horizontal movement
	if movement.x < 0:
		flip_h = false
		play("run")
	elif movement.x > 0:
		flip_h = true
		play("run")
	else:
		play("idle")
	
	# vertical movement
	if movement.y < 0:
		play("jump")