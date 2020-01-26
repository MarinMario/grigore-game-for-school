extends Node2D

var spawn_enemy_timer := 0.0

func _physics_process(delta):
	spawn_enemy_timer += delta
	if spawn_enemy_timer > 2:
		spawn_enemy_timer = 0
		spawn_enemy()


func spawn_enemy():
	var enemy = global.ENEMY.instance()
	add_child(enemy)
	