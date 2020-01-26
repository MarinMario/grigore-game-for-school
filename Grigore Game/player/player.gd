extends KinematicBody2D

var speed := 300
var motion := Vector2()
var shoot_timer := 0.0
var fire_rate := 0.4
var health := 100

func _ready():
	health = 100


func _physics_process(delta):
	motion = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		motion.x += 1
	if Input.is_action_pressed("ui_left"):
		motion.x -= 1
	if Input.is_action_pressed("ui_down"):
		motion.y += 1
	if Input.is_action_pressed("ui_up"):
		motion.y -= 1
	
	motion = move_and_slide(motion * speed)
	
	shoot_timer += delta
	if Input.is_action_pressed("ui_accept") and shoot_timer > fire_rate:
		shoot()
		shoot_timer = 0
	
	if health <= 0:
		get_tree().reload_current_scene()


func shoot():
	var bullet = global.BULLET.instance()
	bullet.global_position = $shoot_point.global_position
	get_parent().add_child(bullet)
	