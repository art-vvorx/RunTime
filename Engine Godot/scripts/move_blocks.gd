extends KinematicBody2D

var speed = 1000
var exit_point = 1800

func _physics_process(delta):
	var collision = move_and_collide(Vector2(0, speed * delta))
	if collision:
		# При ЛЮБОМ столкновении двигаем другой объект вниз и уничтожаем блок
		var other_object = collision.collider
		other_object.position.y += speed / 2 * delta
	
	if global_position.y >= exit_point:
		queue_free()
