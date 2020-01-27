extends Node2D

var spawn_rate := 2

func _ready():
	global.score = 0
	$anims.play("ready")

var spawn_enemy_timer := 0.0

func _physics_process(delta):
	randomize()
	spawn_enemy_timer += delta
	if spawn_enemy_timer > spawn_rate:
		spawn_enemy_timer = 0
		spawn_enemy()
	
	if global.score > global.best:
		global.best = global.score
		
	global.enemy_speed = (global.score+10) * 25


func spawn_enemy():
	var enemy = global.ENEMY.instance()
	add_child(enemy)
	

func _on_anims_animation_finished(anim_name):
	if anim_name == "end":
		get_tree().change_scene("res://menu/main_menu.tscn")
