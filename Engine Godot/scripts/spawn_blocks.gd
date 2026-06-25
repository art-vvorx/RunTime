extends Node2D

# Массив блоков (префабов)
var blocks = []
var block_window = preload("res://assets/prefabs/block_window.tscn")
var block_flame = preload("res://assets/prefabs/block_flame.tscn")
var block_cactus = preload("res://assets/prefabs/block_cactus.tscn")
var block_brick = preload("res://assets/prefabs/block_brick.tscn")

# Переменные как в Unity скрипте
var block1: Node2D
var block2: Node2D

var pos_x_Array = [105, 360, 615]
var pos_y = -150
var pos_x_block_1: float
var pos_x_block_2: float
var start_trigger = false

func _ready():
	# Инициализируем генератор случайных чисел
	randomize()
	
	# Заполняем массив блоков
	blocks = [block_window, block_flame, block_cactus, block_brick]

	var timer = Timer.new()
	timer.wait_time = 1.0  # секунды спавна
	timer.autostart = true
	timer.connect("timeout", self, "start_spawning")
	add_child(timer)

func start_spawning():
	pos_x_block_1 = pos_x_Array[randi() % pos_x_Array.size()]
	pos_x_block_2 = pos_x_Array[randi() % pos_x_Array.size()]
	if pos_x_block_1 == pos_x_block_2:
		spawn_single()
	else:
		spawn_single()
		spawn_twin()

func spawn_single():
	# Создаем первый блок
	var random_block_index = randi() % blocks.size()
	block1 = blocks[random_block_index].instance()
	block1.position = Vector2(pos_x_block_1, pos_y)
	add_child(block1)

func spawn_twin():
	# Создаем второй блок
	var random_block_index = randi() % blocks.size()
	block2 = blocks[random_block_index].instance()
	block2.position = Vector2(pos_x_block_2, pos_y)
	add_child(block2)
