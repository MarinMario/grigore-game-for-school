extends Area2D

func _ready():
	self.global_position.y = rand_range(50, 550)
	self.global_position.x = 1200

func _physics_process(delta):
	self.global_position.x -= global.enemy_speed * delta
	
	if self.global_position.x < -100:
		self.queue_free()

func die():
	self.queue_free()