extends Control

var dialog = [
	"Hola, soy Miguel y voy a pasar a contarles lo que me pasó la semana pasada. En este juego podés interactuar con tu entorno, tanto objetos como personas, así que interactuá con todo lo que puedas.",
]
var dialog2 = [
	"Miguel",
]

var dialog_index = 0
var dialog2_index = 0

var finished = false

func _ready():
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
	dialog2_index += 1

func on_Tween_tween_completed(object,key):
	finished = true
