extends Button

func _on_Button2_pressed():
	get_tree().change_scene("res://Nivel_1.tscn")
	visible = false
	get_tree().paused = false

