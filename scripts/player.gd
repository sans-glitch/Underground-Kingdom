extends CharacterBody2D

var subpixel_position : Vector2
const SPEED = 100.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	#move_pixelized()
	
	
func _process(delta: float) -> void:
	round_sprite_position()
	
	

func move_pixelized(): # WARNING: BAD WITH PHYSICS
	position = subpixel_position
	move_and_slide()
	subpixel_position = position
	position = Vector2(round(position.x), round(position.y))

func round_sprite_position():
	var sprite : Sprite2D = $Sprite2D
	sprite.position = Vector2.ZERO
	var sprite_glob_pos = sprite.global_position
	var new_global_position = sprite.global_position.snapped(Vector2(1, 1))
	#var new_global_position = Vector2(round(sprite_glob_pos.x), round(sprite_glob_pos.y))
	sprite.global_position = new_global_position



func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Killzone"):
		respawn()
		
func respawn():
	get_tree().change_scene_to_file("res://scenes/fixed_level_template.tscn")
