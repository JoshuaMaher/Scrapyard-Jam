extends CharacterBody2D

var movespeed = 500
var bullet_speed = 2000
var bullet = preload("res://Bullet.tscn")
var fire_rate = 1
var can_fire = true

func _process(delta):
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("shoot") and can_fire:
		fire()
		
func _physics_process(delta):
	# MOVEMENT OF CHARACTER
	var motion = Input.get_vector("left", "right", "up", "down")
	velocity = motion * movespeed
	move_and_slide()
	
	
func fire():
	var bullet_instance = bullet.instantiate()
	bullet_instance.position = $BulletPoint.get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	get_tree().get_root().call_deferred("add_child",bullet_instance)
	can_fire = false
	await get_tree().create_timer(fire_rate).timeout
	can_fire = true
