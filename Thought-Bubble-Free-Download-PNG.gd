extends Sprite

var notPaused = true

func _ready():
	visible = false
	notPaused = true

func _on_TextureButton_pressed():
	if notPaused:
		get_tree().paused = true
		notPaused = false
		visible = true
	else:
		get_tree().paused = false
		notPaused = true
		visible = false


