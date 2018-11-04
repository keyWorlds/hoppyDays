extends Node2D

func _ready():
	Global.GameState = self
	print(Global.GameState)

func the_end():
	get_tree().change_scene("res://scenes/GameOver.tscn")