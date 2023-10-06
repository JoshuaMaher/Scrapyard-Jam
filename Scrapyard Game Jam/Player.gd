extends CharacterBody2D

var movespeed = 500

func _process(delta):
	look_at(get_global_mouse_position())
	
func _physics_process(delta):
	
	# MOVEMENT OF CHARACTER
	var motion = Input.get_vector("left", "right", "up", "down")
	velocity = motion * movespeed
	move_and_slide()
	
	
	
	
