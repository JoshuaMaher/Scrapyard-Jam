extends Area2D

var speed = 750
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	position += transform.x * speed * delta


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()
