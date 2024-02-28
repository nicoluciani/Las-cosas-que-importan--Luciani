extends Control

var notPaused = true

func _ready():
	visible = false
	notPaused = true

func _process(delta):
	if Input.is_action_just_pressed("ui_map"):
		if notPaused:
			get_tree().paused = true
			notPaused = false
			visible = true
		else:
			get_tree().paused = false
			notPaused = true
			visible = false
