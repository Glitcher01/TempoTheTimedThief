extends Node2D

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed('screenshot'):
		take_screenshot()

func take_screenshot() -> void:
	get_viewport().get_texture().get_image().save_png('res://assets/image.png')
