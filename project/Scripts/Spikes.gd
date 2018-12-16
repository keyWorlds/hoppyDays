extends Area2D

func _on_Spikes_body_entered(body):
	print("Bunny touched a spike!")
	Global.GameState.ouch()
