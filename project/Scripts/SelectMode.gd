extends Control



func _on_EasyButton_pressed():
	get_tree().change_scene(Global.Level1)

func _on_BackButton_pressed():
	get_tree().change_scene(Global.MainMenu)
