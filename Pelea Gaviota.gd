extends Node2D
onready var enemigo = $enemigo


func _on_Button_pressed():
	enemigo.text -= 4
