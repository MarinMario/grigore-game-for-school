extends Node2D


func _ready():
	$score.text = "Score: " + str(global.score) + "\nbest: " + str(global.best)
	$anims.play("ready")

func _on_play_pressed():
	$anims.play("end")


func _on_exit_pressed():
	get_tree().quit()


func _on_anims_animation_finished(anim_name):
	if anim_name == "end":
		get_tree().change_scene("res://world/world.tscn")
