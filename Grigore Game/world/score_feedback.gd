extends Node2D

var semn = "+"

func _ready():
	$anim.play("ready")

func _process(delta):
	$label/label.text = semn
	
	if semn == "+":
		$label/label.modulate = Color(0.1, 0.5, 0.1)
	else:
		$label/label.modulate = Color(0.5, 0.1, 0.1)

func _on_anim_animation_finished(anim_name):
	self.queue_free()
