extends TextureButton

export(Texture) var music_on_texture
export(Texture) var music_off_texture

func _ready():
	if not SoundManager:
		return
	
	toggle_mode = true
	
	# Инвертируем состояние: музыка включена -> кнопка НЕ нажата
	var music_on = SoundManager.is_music_enabled()
	pressed = not music_on
	update_button_texture(music_on)
	
	connect("toggled", self, "_on_button_toggled")

func _on_button_toggled(button_pressed):
	# button_pressed = true -> кнопка нажата -> музыка выключена
	var music_on = not button_pressed
	SoundManager.set_music_on(music_on)
	update_button_texture(music_on)

func update_button_texture(music_on):
	if music_on:
		# Музыка включена - normal (не нажата)
		if music_on_texture:
			texture_normal = music_on_texture
	else:
		# Музыка выключена - pressed (нажата)
		if music_off_texture:
			texture_normal = music_off_texture