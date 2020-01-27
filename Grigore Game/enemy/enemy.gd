extends Area2D

var types = ["good", "bad"]
var type: String
var state := "enemy"

func _ready():
	self.global_position.y = rand_range(50, 550)
	self.global_position.x = 1200
	
	type = types[randi() % types.size()]
	if type == "bad":
		$sprite.modulate = Color(100, 0, 0)
	else:
		$sprite.modulate= Color(0, 100, 0)

func _physics_process(delta):
	self.global_position.x -= global.enemy_speed * delta
	
	if self.global_position.x < -100:
		self.queue_free()
	
	$sprite.play(state)

func die():
	global.score += 1 if type == "bad" else -1
	if global.score < 0: global.score = 0
	call_deferred("disable_collision")
	state = "explosion"
	$Label.text = ""

func _on_enemy_body_entered(body):
	if body.name == "player":
		body.health -= int(rand_range(10,40))
		die()

func disable_collision():
	$CollisionShape2D.disabled = true
