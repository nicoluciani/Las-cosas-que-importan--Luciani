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
	"Che disculpame, ¿van a pasar el partido de Ñuls acá?",
	"Sí maestro.",
	"Buenísimo, ¿Quilmes grande tenés?",
	"Obvio, ¿me podes hacer un favor antes?",
	"Sí, decime.",
	"Hay un loquito al lado del tele que se la pasa gritando, ¿no podés ir a decirle algo?",
	"Me parece que ese es un problema tuyo amigo.",
	"Te regalo la cerveza.",
	"Tus deseos son ordenes, ya lo hago callar.",
]
var dialog2 = [
	"Miguel",
	"Barman",
	"Miguel",
	"Barman",
	"Miguel",
	"Barman",
	"Miguel",
	"Barman",
	"Miguel",
]

var dialog_index = 0
var dialog2_index = 0

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
		emit_signal("quest1")

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


func on_Tween_tween_completed(object,key):
	finished = true

