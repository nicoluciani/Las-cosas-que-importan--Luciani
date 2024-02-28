extends Panel

onready var hpLabel = $StatsContainer/HP
onready var apLabel = $StatsContainer/AP


func _on_PlayerStats_hp_changed(value):
	hpLabel.text = "Puntos de vida\n"+str(value)

func _on_PlayerStats_ap_changed(value):
	apLabel.text = "Movimientos\n"+str(value)


