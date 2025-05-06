extends Area2D

@export var item_name : String
var inventory : Control

func _ready() -> void:
	find_inventory_node()
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") and is_colliding_with_player():
		interacted_with()

## The function that runs when the item is interacted with by the player
func interacted_with():
	inventory.add_item(item_name)
	hide()

## Finds the inventory manager node in the scene tree
func find_inventory_node():
	inventory = get_tree().get_first_node_in_group("Inventory")

## Determines if the player is colliding with the item
func is_colliding_with_player():
	var coll_bodies = get_overlapping_bodies()
	for body in coll_bodies:
		if body.is_in_group("Player"):
			return true
	return false
