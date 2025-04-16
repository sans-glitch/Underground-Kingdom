extends Node2D

var sprite : Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var children = get_children()
	for child in children:
		if child is Sprite2D:
			sprite = child


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_parent().progress += delta * 10
