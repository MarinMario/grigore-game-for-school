extends Node2D


func _on_play_pressed():
	get_tree().change_scene("res://world/world.tscn")


func _on_exit_button_up():
	get_tree().quit()
