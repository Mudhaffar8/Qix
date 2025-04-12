extends PathFollow2D

@onready var player : Player = $Player

var input : Vector2

const SPEED = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	progress_ratio = 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var dir = Input.get_axis("left", "right")
	
	progress += dir * player.SPEED * delta
	
