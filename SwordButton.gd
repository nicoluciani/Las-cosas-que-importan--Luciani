extends Button
const BattleUnits = preload("res://BattleUnits.tres")

func _on_SwordButton_pressed():
	var enemy = BattleUnits.Enemy
	var playerStats = BattleUnits.PlayerStats
	if enemy != null and playerStats != null:
		enemy.take_damage(4)
		playerStats.mp += 2
		playerStats.ap -= 1
