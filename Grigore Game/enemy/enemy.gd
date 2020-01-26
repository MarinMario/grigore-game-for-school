extends Area2D

var types = ["good", "bad"]
var type: String

func _ready():
	self.global_position.y = rand_range(50, 550)
	self.global_position.x = 1200
	
	type = types[randi() % types.size()]
	if type == "bad":
		$ColorRect.color = Color(100, 0, 0)
	else:
		$ColorRect.color = Color(0, 100, 0)

func _physics_process(delta):
	self.global_position.x -= global.enemy_speed * delta
	
	if self.global_position.x < -100:
		self.queue_free()

func die():
	global.score += 1 if type == "bad" else -1
	if global.score < 0: global.score = 0
	
	self.queue_free()

func _on_enemy_body_entered(body):
	if body.name == "player":
		body.health -= int(rand_range(10,40))
		die()
