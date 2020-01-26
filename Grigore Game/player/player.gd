extends KinematicBody2D

var speed := 300
var motion := Vector2()


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
	
	
	if Input.is_action_just_pressed("ui_accept"):
		shoot()


func shoot():
	var bullet = global.BULLET.instance()
	bullet.global_position = self.global_position
	get_parent().add_child(bullet)
	