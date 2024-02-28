extends "res://ActionButton.gd"

const Slash = preload("res://Slash.tscn")

func create_slash(position):
	var slash = Slash.instance()
	var main = get_tree().current_scene
	main.add_child(slash)
	slash.global_position = position

func _on_KickActionButton_pressed():
	var enemy = BattleUnits.Enemy
	var playerStats = BattleUnits.PlayerStats
	if enemy != null and playerStats != null and playerStats.ap == 3:
		create_slash(enemy.global_position)
		enemy.take_damage(7)
		playerStats.ap -= 3
