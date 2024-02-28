extends Area2D
func _ready():
	$Dialogo.hide()
	$Nombre.hide()
	$TextureRect.hide()

signal quest1
signal quest2

var dialog = [
	"El primer grito llegó un domingo por la tarde, hará cosa de un año. Y te digo, fue apenas un gritito, como si me lo hubieran tirado dentro del departamento, ¿entendés? Y yo sabía que jugaba Ñuls porque uno siempre sabe esas cosas. La cosa es que con Laura estábamos bien, y no daba para ir a la cancha y dejarla de garpe, o encender la tele. Por esos días andábamos bien. ",
	"Te querías matar",
	"No, Turco, no me quería matar. La pasábamos bien.",
	"Te querías matar.",
	"Te digo que no, no lo soporto al vecino.",
	"¿Y Laura?",
	"No la metás a Laura. Qué tanto la metés a Laura. Te quiero contar lo del forro hijo de mil puta del vecino.",
	"Bueno contame",
	"Me cagaba los goles, me los gritaba antes.Ya me estaba rompiendo las pelotas el asunto. Un día, está bien, dos, no pasa nada. Pero cuando es medio campeonato te empieza a hinchar bien las pelotas.",
	"A ver, pará. Andá a ver como está el pescado."
]
var dialog2 = [
	"Miguel",
	"Turco",
	"Miguel",
	"Turco",
	"Miguel",
	"Turco",
	"Miguel",
	"Turco",
	"Miguel",
	"Turco",
]
var dialog3 = [
	"Parece que va bien. ¿Tenés idea donde está la sal?",
	"Sí, se la llevó la gaviota que está allá.",
	"¿QUÉ?",
	"Lo que escuchaste, me la choreó una gaviota.",
	"¿Y no pensabas ir a buscarla? Tengo que hacer todo yo.",
]
var dialog4 = [
	"Miguel",
	"Turco",
	"Miguel",
	"Turco",
	"Miguel",
]
var dialog_index = 0
var dialog2_index = 0
var dialog3_index = 0
var dialog4_index = 0
var finished = false
var can_interact = false
var can_interact2 = false
var can_interact3 = false
var quest1 = false
var quest2 = false

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
		quest1 = true
		emit_signal("quest1")
	if Input.is_action_just_pressed("ui_interact") and can_interact and can_interact2:
		get_tree().paused = true
		$TextureRect.show()
		$Dialogo.show()
		$Nombre.show()
		load_dialog3()
		load_dialog4()
		quest2 = true
		emit_signal("quest2")
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
	dialog4_index += 1

func on_Tween_tween_completed(object,key):
	finished = true

func _on_Parrilla_body_entered(body):
	if body.name == "Jugador":
		if quest1 == true:
			can_interact2 = true

func _on_Gaviota_body_entered(body):
	if body.name == "Jugador":
		if quest2 == true:
			can_interact3 = true


func _on_Parrilla_quest3():
	can_interact2 = true
