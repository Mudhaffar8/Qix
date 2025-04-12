class_name Player
extends Node2D

@export var speed := 10

var is_drawing := false
var trail_points : Array[Vector2] = []

@onready var trail : Line2D = $Trail

func _physics_process(delta):
	var input := Vector2.ZERO
	
	# Detect Player Input
	if Input.is_action_pressed("up"):
		input.y -= 1
	elif Input.is_action_pressed("down"):
		input.y += 1
	elif Input.is_action_pressed("left"):
		input.x -= 1
	if Input.is_action_pressed("right"):
		input.x += 1

	if input != Vector2.ZERO:
		# Move based on grid size and player input
		global_position += input * GameManager.GRID_SIZE

		# Only draw when player moves
		if is_drawing:
			update_trail(global_position)
	
	if Input.is_action_just_pressed("draw"):
		is_drawing = !is_drawing
		if is_drawing:
			trail_points = [global_position]
			trail.clear_points()
			trail.add_point(global_position)
		else:
			complete_area()

func update_trail(pos: Vector2):
	if trail_points.size() == 0 or trail_points[-1].distance_to(pos) > 1:
		trail_points.append(pos)
		trail.add_point(pos)

func complete_area():
	print("Shape completed. Trail:", trail_points)
	trail_points.clear()
	trail.clear_points()
