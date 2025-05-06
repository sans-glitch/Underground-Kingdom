extends Area2D

@export var dialogue_name : String

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") and is_colliding_with_player():
		Dialogic.start(dialogue_name)

## Determines if the player is colliding with its hitbox
func is_colliding_with_player():
	var coll_bodies = get_overlapping_bodies()
	for body in coll_bodies:
		if body.is_in_group("Player"):
			return true
	return false
