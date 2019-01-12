extends AnimatedSprite

var taken = false

func _on_Area2D_body_entered(body):
	if not taken:
		taken = true
		Global.GameState.coinUp()
		$AnimationPlayer.play("pickedup");
		Global.CoinSFX.play()

func destroy():
	queue_free()
