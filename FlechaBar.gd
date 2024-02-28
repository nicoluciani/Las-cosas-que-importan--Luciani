extends Area2D
var can_interact = false
func _ready():
	$Label.hide()

func _on_Area2D_body_entered(body):
	if body.name == "Jugador":
		$Label.show()
		can_interact = true

func _on_Area2D_body_exited(body):
	if body.name == "Jugador":
		$Label.hide()
		can_interact = false

func _input(event):
	if Input.is_action_just_pressed("ui_interact") and can_interact:
		$Label.hide()
		get_tree().change_scene("res://Nivel_1.tscn")
