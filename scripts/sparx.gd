class_name Sparx
extends Node2D

'''
Class for the Sparx enemies
'''

const SPEED := 200

@onready var hitbox : Area2D = $Hitbox

var velocity := Vector2.ZERO
var dir := Vector2.UP

var boundary_min = Vector2(240, 128)
var boundary_max = Vector2(1004, 556)

func _physics_process(delta: float) -> void:
	velocity = dir * SPEED
	position += velocity * delta

	# Check for collisions
	if ((position.y > boundary_max.y and dir.y) or (position.y < boundary_min.y and dir.y < 0)):
		dir.y *= -1
	elif ((position.x < boundary_min.x and dir.x < 0) or (position.x > boundary_max.x and dir.x > 0)):
		dir.x *= -1

func _on_hitbox_area_entered(area: Area2D) -> void:
	var body : Node2D = area.get_parent()
	
	if body.has_method("lose_life"):
		body.lose_life()
