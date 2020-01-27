extends Area2D

var types = ["bad", "good"]
var type: String
var state := "enemy"
var num1; var num2; var num3;

func _ready():
	randomize()
	self.global_position.y = rand_range(50, 550)
	self.global_position.x = 1200
	
	type = types[randi() % types.size()]
	num1 = int(rand_range(0, 10))
	num2 = int(rand_range(0, 10))
	
	if type == "good":
		num3 = num1 + num2
	else:
		num3 = int(rand_range(0, 20))
		while num3 == num1 + num2:
			num3 = int(rand_range(0, 20))
	
	$Label.text = str(num1) + " + " + str(num2) + " = " + str(num3)

func _physics_process(delta):
	self.global_position.x -= global.enemy_speed * delta
	
	if self.global_position.x < -100:
		self.queue_free()
	
	$sprite.play(state)

func die():
	if type == "bad":
		global.score += 1
		spawn_score_feedback("+")
	else:
		global.score -= 1
		spawn_score_feedback("-")
		
		
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

func spawn_score_feedback(semn):
	var score_feedback = global.SCORE_FEEDBACK.instance()
	score_feedback.semn = semn
	score_feedback.global_position = Vector2(
									rand_range(400, 600),
									rand_range(100, 300)
									)
		
	get_parent().add_child(score_feedback)
