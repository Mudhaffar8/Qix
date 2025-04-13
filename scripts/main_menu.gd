extends Control

'''
Main Menu Script
'''

@onready var title : Label = $Title

var default_pos : Vector2
var time : float = 0

const amplitude : float = 5.0
const frequency : float = 4.0

func _ready() -> void:
	default_pos = title.position


func _process(delta: float) -> void: 
	# Float animation
	time += delta * frequency

	title.set_position(default_pos + Vector2(0, sin(time) * amplitude))


func _unhandled_key_input(event):
	if event.is_pressed():
		SceneManager.switch_scene("res://scenes/game.tscn")
