extends "res://ActionButton.gd"

func _on_pressed():
	var playerStats = BattleUnits.PlayerStats
	if playerStats != null and playerStats.ap == 3 or playerStats.ap == 2:
			playerStats.hp += 5
			playerStats.ap -= 2
