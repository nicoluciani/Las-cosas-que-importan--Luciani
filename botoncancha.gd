extends Button
func _on_Button4_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Nivel_4.tscn")
