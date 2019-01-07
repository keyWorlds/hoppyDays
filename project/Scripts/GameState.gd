extends Node2D

export var initial_life_points = 5
var life_points
var coins = 0

func _ready():
	Global.GameState = self
	print(Global.GameState)
	life_points = initial_life_points
	updateGUI()

func ouch():
	life_points -= 1
	Global.Player.damage()
	updateGUI()
	if life_points < 0:
		the_end()

func updateGUI():
	Global.GUI.updateGUI(life_points)

func coinUp():
	coins += 1

func the_end():
	get_tree().change_scene("res://scenes/GameOver.tscn")