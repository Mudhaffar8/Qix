extends Control

'''
Script for Game Over Screen. Returns to game after a key is pressed.
'''


func _ready() -> void:
	pass
	


func _unhandled_key_input(event):
	if event.is_pressed():
		SceneManager.switch_scene("res://scenes/game.tscn")
