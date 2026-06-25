extends TextureButton

export(Texture) var sfx_on_texture
export(Texture) var sfx_off_texture

func _ready():
	if not SoundManager:
		return
	
	# Включаем режим Toggle
	toggle_mode = true
	
	# Устанавливаем состояние кнопки из сохраненных настроек
	var sfx_on = SoundManager.is_sfx_enabled()
	pressed = not sfx_on  # 👈 ИНВЕРТИРУЕМ! Если звук включен - кнопка НЕ нажата
	update_button_texture(sfx_on)
	
	# Подключаем сигнал toggled
	connect("toggled", self, "_on_button_toggled")

func _on_button_toggled(button_pressed):
	# button_pressed = true значит кнопка нажата -> звук выключен
	# button_pressed = false значит кнопка не нажата -> звук включен
	var sfx_on = not button_pressed  # 👈 Инвертируем
	SoundManager.set_sfx_on(sfx_on)
	update_button_texture(sfx_on)

func update_button_texture(sfx_on):
	if sfx_on:
		# Звук включен - normal (не нажата)
		if sfx_on_texture:
			texture_normal = sfx_on_texture
	else:
		# Звук выключен - pressed (нажата)
		if sfx_off_texture:
			texture_normal = sfx_off_texture
