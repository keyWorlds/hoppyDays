extends Node2D

export var initial_life_points = 5
export var coin_target = 3

var life_points
var coins = 0

onready var GUI = Global.GUI

func _ready():
	Global.GameState = self
	print(Global.GameState)
	life_points = initial_life_points
	updateGUI()

func ouch():
	life_points -= 1
	Global.Player.damage()
	animateGUI("Hurt")
	updateGUI()
	if life_points < 0:
		the_end()

func updateGUI():
	GUI.updateGUI(coins, life_points)

func coinUp():
	coins += 1
	animateGUI("CoinPulse")
	updateGUI()
	
	var multiple_of_coin_target = (coins % coin_target) == 0
	if multiple_of_coin_target:
		lifeUp()

func lifeUp():
	life_points += 1
	animateGUI("LifePulse")
	updateGUI()

func animateGUI(animation):
	GUI.animate(animation)

func the_end():
	get_tree().change_scene("res://scenes/GameOver.tscn")