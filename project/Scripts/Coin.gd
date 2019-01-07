extends AnimatedSprite

func _on_Area2D_body_entered(body):
	Global.GameState.coinUp()
	$AnimationPlayer.play("pickedup");

func destroy():
	queue_free()
