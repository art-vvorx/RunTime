extends Sprite

var speed = 650

func _ready():
	pass

func _process(delta):
	position.y += speed * delta
	if position.y >= 3920:
		position.y = -2320  # телепортировать наверх
		# или queue_free()  # уничтожить объект
