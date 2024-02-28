extends Control

var dialog = [
	"Después nos fuimos a lo de Tapia. Hacía varios días ya que me quedaba a dormir en su casa.",
	"¿Y el tipo?, ¿el vecino?",
	"No es más mi vecino.",
	"¿No volviste más al departamento?",
	"Ni sé cuánto hace",
	"No se lo había dicho a nadie, ¿sabés? A Tapia sí, pero a nadie más.",
	"Eso, Turco. Era eso lo que te quería contar.",
]
var dialog2 = [
	"Miguel",
	"Turco",
	"Miguel",
	"Turco",
	"Miguel",
	"Miguel",
	"Miguel",
]

var dialog_index = 0
var dialog2_index = 0
var finished = false
func _ready():
	$Label.show()

func _input(event):
	if Input.is_action_just_pressed("ui_interact"):
		$Label.hide()
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
		get_tree().change_scene("res://creditos.tscn")
	dialog2_index += 1

func on_Tween_tween_completed(object,key):
	finished = true
