extends Control

func _on_Reload_pressed():
	get_tree().change_scene(Global.SelectMode)

func _on_Exit_pressed():
	get_tree().quit()
