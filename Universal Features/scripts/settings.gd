extends Control

signal close_settings

func _on_close_settings_pressed():
	close_settings.emit()
