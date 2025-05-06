extends RigidBody2D

const SPEED = 50
var sprite : Sprite2D
var direction : float = 1
var paused : bool
@export var walk_duration : float
@export var pause_duration : float
@export var turn_chance : float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$WalkDuration.wait_time = walk_duration
	$WalkDuration.start()
	var children = get_children()
	for child in children:
		if child is Sprite2D:
			sprite = child


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $WalkDuration.time_left > 0:
		linear_velocity.x = direction * SPEED
	elif not paused:
		paused = true
		freeze = true
		await get_tree().create_timer(pause_duration).timeout
		if randf() < turn_chance:
			direction *= -1
		$WalkDuration.start()
		freeze = false
		paused = false
	round_sprite_position()

func round_sprite_position():
	sprite.position = Vector2.ZERO
	var sprite_glob_pos = sprite.global_position
	var new_global_position = sprite.global_position.snapped(Vector2(1, 1))
	#var new_global_position = Vector2(round(sprite_glob_pos.x), round(sprite_glob_pos.y))
	sprite.global_position = new_global_position

func flip_sprite():
	if direction > 0:
		sprite.flip_h = false
	sprite.flip_h = true
