extends Button
func _on_Button3_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Nivel_3.tscn")
