class_name GameManager
extends Node

'''
General use class for managing global variables.

Example use case
-------------------

GameManager.score += 1
'''

var score : int = 0
var percent_fill : float = 0

const GRID_SIZE : int = 16


@onready var health_label : Label = $"../UI/Health"


func _on_player_life_depleted(health : int) -> void:
	health_label.text = "Health: " + str(health)
