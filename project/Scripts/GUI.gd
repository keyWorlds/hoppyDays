extends CanvasLayer

func _ready():
	Global.GUI = self

func updateGUI(life_points):
	$Banner/HBoxContainer/LifeCounter.text = str(life_points)