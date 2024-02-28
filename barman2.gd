extends Area2D
signal quest1
func _ready():
	$Dialogo.hide()
	$Nombre.hide()
	$TextureRect.hide()
var can_interact = false
var can_interact2 = false
var can_interact3 = false
var quest1 = false
var quest2 = false
var dialog = [
	"Listo, ya no va a molestar más ese tipo.",
	"Gracias flaco. Ya que estás acá, ¿me harías otro favor?.",
	"Te va a costar otra cerveza.",
	"Sos difícil de comprar eh. Hay una chica, Agustina se llama, que le quiero dar mi número.",
	"Qué me viste cara de Cupido a mí.",
	"Dale flaco, llevale estas papas con este papelito, decile que es de parte mía.",
	"Bueno, ya vengo.",
]
var dialog2 = [
	"Miguel",
	"Barman",
	"Miguel",
	"Barman",
	"Miguel",
	"Barman",
	"Miguel",
]
var dialog3 = [
	"Misión cumplida, creo que tenés chances.",
	"Uy gracias che, acá tenés la otra cerveza.",
	"Genial, ahora puedo ir a ver el partido tranquilo.",
]
var dialog4 = [
	"Miguel",
	"Barman",
	"Miguel",
]

var dialog_index = 0
var dialog2_index = 0
var dialog3_index = 0
var dialog4_index = 0
var finished = false
func _on_Barman_body_entered(body):
	if body.name == "Jugador":
		can_interact = true
func _on_Barman_body_exited(body):
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
		quest1 = true
	if Input.is_action_just_pressed("ui_interact") and can_interact and can_interact2:
		get_tree().paused = true
		$TextureRect.show()
		$Dialogo.show()
		$Nombre.show()
		load_dialog3()
		load_dialog4()
		quest2 = true

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
		emit_signal("quest1")
	dialog2_index += 1
func load_dialog3():
	if dialog3_index < dialog3.size():
		finished = false
		$Dialogo.bbcode_text = dialog3[dialog3_index]
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
	dialog3_index += 1
func load_dialog4():
	if dialog4_index < dialog4.size():
		finished = false
		$Nombre.bbcode_text = dialog4[dialog4_index]
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
		get_tree().change_scene("res://Nivel_4.tscn")
	dialog4_index += 1

func on_Tween_tween_completed(object,key):
	finished = true

func _on_Area2D_quest2():
	can_interact2 = true
