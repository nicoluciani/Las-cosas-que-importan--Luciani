extends Area2D
func _ready():
	$Dialogo.hide()
	$Nombre.hide()
	$TextureRect.hide()
var can_interact = false
var can_interact2 = false
var dialog = [
	"¡VAAAAAMO ÑUUBEEEL!",
	"Ah bueno, lo que me faltaba",
]
var dialog2 = [
	"Loco",
	"Miguel",
]
var dialog3 = [
	"Che, disculpame, el barman me dice que estás molestando a los demás y quería saber si podés dejar de gritar.",
	"¡VAAAAAMO ÑUUBEEEL!",
	"Flaco te lo estoy pidiendo bien.",
	"¿Y guién so´ vo´?",
	"Bueno si querés lo arreglamos por las malas, no tengo problema.",
	"Dale qué te hace´ tanto el vivo."
]
var dialog4 = [
	"Miguel",
	"Loco",
	"Miguel",
	"Loco",
	"Miguel",
	"Loco",
]

var dialog_index = 0
var dialog2_index = 0
var dialog3_index = 0
var dialog4_index = 0

var finished = false
func _on_Loco_body_entered(body):
	if body.name == "Jugador":
		can_interact = true
func _on_Loco_body_exited(body):
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
	if Input.is_action_just_pressed("ui_interact") and can_interact and can_interact2:
		get_tree().paused = true
		$TextureRect.show()
		$Dialogo.show()
		$Nombre.show()
		load_dialog3()
		load_dialog4()

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
		get_tree().change_scene("res://Battle2.tscn")
	dialog4_index += 1

func on_Tween_tween_completed(object,key):
	finished = true



func _on_Barman_quest1():
	can_interact2 = true
