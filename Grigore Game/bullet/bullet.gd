extends Area2D

var speed := 1000

func _physics_process(delta):
	self.global_position.x += speed * delta