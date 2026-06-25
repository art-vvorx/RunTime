extends Control

onready var hero = $hero

var swipe_start_position: Vector2
var is_swiping = false
var min_swipe_distance = 50
var move_distance = 255  # Дистанция перемещения
var positions = [105, 360, 615]  # Все возможные позиции
var current_position_index = 1   # Начинаем с центральной позиции (360)

func _ready():
	# Устанавливаем начальную позицию в центр (360)
	hero.position.x = positions[current_position_index]

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			swipe_start_position = event.position
			is_swiping = true
		else:
			if is_swiping:
				handle_swipe_end(event.position)
				is_swiping = false
	
	if event is InputEventScreenTouch:
		if event.pressed:
			swipe_start_position = event.position
			is_swiping = true
		else:
			if is_swiping:
				handle_swipe_end(event.position)
				is_swiping = false
				
	if Input.is_action_just_pressed("move_right_button"):
		move_right()
		SoundManager.play_swipe()
	elif Input.is_action_just_pressed("move_left_button"):
		move_left()
		SoundManager.play_swipe()

func handle_swipe_end(end_position: Vector2):
	var swipe_vector = end_position - swipe_start_position
	var swipe_distance = swipe_vector.length()
	
	if swipe_distance < min_swipe_distance:
		return
	
	if abs(swipe_vector.x) > abs(swipe_vector.y):
		if swipe_vector.x > 0:
			# Свайп вправо - двигаемся к следующей позиции справа
			move_right()
			SoundManager.play_swipe()
		else:
			# Свайп влево - двигаемся к следующей позиции слева
			move_left()
			SoundManager.play_swipe()

		#здесь надо добавить если на клавиатуре нажата стрелочка вправо то двигаемся вправо и влево соответсветнно


func move_right():
	# Если не достигли правой границы
	if current_position_index < positions.size() - 1:
		current_position_index += 1
		hero.position.x = positions[current_position_index]
		# Поворот спрайта вправо
		hero.scale.x = -0.75
		#print("Перемещение вправо. Позиция: ", positions[current_position_index])

func move_left():
	# Если не достигли левой границы
	if current_position_index > 0:
		current_position_index -= 1
		hero.position.x = positions[current_position_index]
		# Поворот спрайта влево
		hero.scale.x = 0.75
		#print("Перемещение влево. Позиция: ", positions[current_position_index])