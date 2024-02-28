extends Button

func _on_Button_pressed():
	get_tree().change_scene("res://Nivel_2.tscn")
	visible = false
	get_tree().paused = false
