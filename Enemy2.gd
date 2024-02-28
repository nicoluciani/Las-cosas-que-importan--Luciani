extends Node2D

const BattleUnits = preload("res://BattleUnits.tres")

export(int) var hp = 50 setget set_hp
export(int) var damage = 7

onready var hpLabel = $HPLabel
onready var animationPlayer = $AnimationPlayer

signal died
signal end_turn

func set_hp(new_hp):
	hp = new_hp
	if hpLabel != null:
		hpLabel.text = str(hp) + "hp"

func _ready():
	BattleUnits.Enemy = self

func _exit_tree():
	BattleUnits.Enemy = null

func attack() -> void:
	yield(get_tree().create_timer(0.4), "timeout")
	animationPlayer.play("Attack")
	yield(animationPlayer, "animation_finished")
	emit_signal("end_turn")

func deal_damage():
	BattleUnits.PlayerStats.hp -= damage

func take_damage(amount):
	self.hp -= amount
	if is_dead():
		emit_signal("died")
		queue_free()
		get_tree().change_scene("res://Nivel4_2.tscn")
	else:
		animationPlayer.play("Shake")

func is_dead():
	return hp <= 0
