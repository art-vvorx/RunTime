extends TextureButton

func _pressed():
	if CheckSettings.get_first_run_status():
		get_tree().change_scene("res://assets/scenes/main_scene.tscn")
	else:
		get_tree().change_scene("res://assets/scenes/first_manual_scene.tscn")