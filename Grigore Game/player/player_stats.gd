extends CanvasLayer

func _process(delta):
	$health.value = get_parent().health
	$score.text = "Score: " + str(global.score) + "\nbest: " + str(global.best)

