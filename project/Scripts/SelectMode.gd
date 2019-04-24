extends Control

func _on_EasyButton_pressed():
	setModeAndStart()

func _on_BackButton_pressed():
	get_tree().change_scene(Global.MainMenu)

func setModeAndStart():
	#Global.GameState.the_end()
	# nonexistent function?!?!
	get_tree().change_scene(Global.Level1)
