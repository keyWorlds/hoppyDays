extends CanvasLayer

func _ready():
	Global.GUI = self

func updateGUI(coins, life_points):
	$Banner/HBoxContainer/CoinCounter.text = str(coins)
	$Banner/HBoxContainer/LifeCounter.text = str(life_points)

func animate(animation):
	$AnimationPlayer.play(animation)