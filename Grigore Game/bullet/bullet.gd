extends Area2D

var speed := 1500

func _physics_process(delta):
	self.global_position.x += speed * delta
	
	if self.global_position.x > 1200:
		self.queue_free()

func _on_bullet_area_entered(area):
	if area.is_in_group("enemy"):
		area.die()
		call_deferred("disable_c")

func disable_c():
	$CollisionShape2D.disabled = true
	$ColorRect.visible = false
	
