class_name Qix
extends Node


'''
Class for the Qix enemies
'''

@onready var hitbox : Area2D = $Hitbox


func _on_hitbox_area_entered(area: Area2D) -> void:
	var body : Node2D = area.get_parent()
	
	if body.has_method("game_over"):
		SceneManager.switch_scene("res://scenes/game_over.tscn")
