extends CanvasLayer

func _on_options_pressed():
	get_tree().paused = !get_tree().paused
	if get_tree().paused:
		$anims.play("ingame_menu")
	else:
		$anims.play_backwards("ingame_menu")


func _on_exit_pressed():
	get_tree().paused = false
	get_parent().get_node("anims").play("end")


func _on_resume_pressed():
	$anims.play_backwards("ingame_menu")
	get_tree().paused = false
