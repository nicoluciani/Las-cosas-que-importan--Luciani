extends Area2D
func _ready():
	$Dialogo.hide()
	$Nombre.hide()
	$TextureRect.hide()
var can_interact = false

var dialog = [
	"Acá tenés la sal, un poquito más de cuidado te pido nomás.",
	"Bueno no me rompás las pelotas tampoco, disculpame. ¿Pasó algo más con el viejo este?",
	"Me haces acordar y me re caliento. Estaba con Laura en el departamento...",
]
var dialog2 = [
	"Miguel",
	"Turco",
	"Miguel",
]

var dialog_index = 0
var dialog2_index = 0

var finished = false
func _on_Turco1_body_entered(body):
	if body.name == "Jugador":
		can_interact = true
func _on_Turco1_body_exited(body):
	if body.name == "Jugador":
		can_interact = false
func _process(delta):
	if Input.is_action_just_pressed("ui_interact") and can_interact:
		get_tree().paused = true
		$TextureRect.show()
		$Dialogo.show()
		$Nombre.show()
		load_dialog()
		load_dialog2()

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$Dialogo.bbcode_text = dialog[dialog_index]
		$Dialogo.percent_visible = 0
		$Tween.interpolate_property(
			$Dialogo, "percent_visible", 0, 1, 1,
			 Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		$Dialogo.hide()
		$Nombre.hide()
		$TextureRect.hide()
		get_tree().paused = false
	dialog_index += 1
func load_dialog2():
	if dialog2_index < dialog2.size():
		finished = false
		$Nombre.bbcode_text = dialog2[dialog2_index]
		$Nombre.percent_visible = 0
		$Tween.interpolate_property(
			$Nombre, "percent_visible", 0, 1, 1,
			 Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		$Dialogo.hide()
		$Nombre.hide()
		$TextureRect.hide()
		get_tree().paused = false
		get_tree().change_scene("res://Nivel_3.tscn")
	dialog2_index += 1

func on_Tween_tween_completed(object,key):
	finished = true


